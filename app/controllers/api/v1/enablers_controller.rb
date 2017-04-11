class Api::V1::EnablersController < ApplicationController
  include UserHelpers

  def create
    @enabler = Enabler.new(enabler_params)
    if @enabler.save
      # VerificationServices.call(@enabler)
      send_with_data(200, send_public_data(@enabler), {success: 'Please verify the OTP sent'})
    else
      send_without_data(422, set_errors(@enabler))
    end
  end

  def update
    begin
      @enabler = ShopOwner.find(params[:id])
      if @enabler.update(enabler_params)
        send_with_data(200, send_public_data(@enabler), {success: 'Update successful'})
      else
        send_without_data(422, set_errors(@enabler))
      end
    rescue ActiveRecord::RecordNotFound
      send_without_data(404, { errors: 'Shop Owner not found' })
    end
  end

  def verify_otp
    # Verify otp
    code = params[:email] || params[:phone]
    # Find shopowner by email or phone
    @enabler = Enabler.find_by("email = ? or phone = ?", code, code)
    if @enabler
      if @enabler.otp_verified_at
        return send_without_data(422, { errors: 'OTP already verified' })
      end
      resp = RegistrationServices.verify_otp(@enabler, params[:otp])
      if resp == 'success'
        return send_with_data(200, send_public_data(@enabler), {success: 'OTP verified'})
      else
        return send_without_data(422, {errors: 'OTP invalid'})
      end
    else
      return send_without_data(404, { errors: 'Record not found' })
    end
  end

  private

    def enabler_params
      params.require(:enabler).permit(:email, :password, :password_confirmation, :name, :phone)
    end

end
