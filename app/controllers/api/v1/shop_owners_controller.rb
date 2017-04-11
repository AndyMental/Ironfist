class Api::V1::ShopOwnersController < ApplicationController
  include UserHelpers

  def create
    # Create shopowner
    @shop_owner = ShopOwner.new(shop_owner_params)
    puts shop_owner_params
    if @shop_owner.save
      RegistrationServices.send_confirmation_otp(@shop_owner)
      send_with_data(200, send_public_data(@shop_owner), {success: 'Please verify the OTP sent'})
    else
      send_without_data(422, set_errors(@shop_owner))
    end
  end

  def update
    # Update shopowner
    begin
      @shop_owner = ShopOwner.find(params[:id])
      if @shop_owner.update(shop_owner_params)
        send_with_data(200, send_public_data(@shop_owner), {success: 'Update successful'})
      else
        send_without_data(422, set_errors(@shop_owner))
      end
    rescue ActiveRecord::RecordNotFound
      send_without_data(404, { errors: 'Shop Owner not found' })
    end
  end

  def verify_otp
    # Verify otp
    code = params[:email] || params[:phone]
    # Find shopowner by email or phone
    @shop_owner = ShopOwner.find_by("email = ? or phone = ?", code, code)
    if @shop_owner
      if @shop_owner.otp_verified_at
        return send_without_data(422, { errors: 'OTP already verified' })
      end
      resp = RegistrationServices.verify_otp(@shop_owner, params[:otp])
      if resp == 'success'
        return send_with_data(200, send_public_data(@shop_owner), {success: 'OTP verified'})
      else
        return send_without_data(422, {errors: 'OTP invalid'})
      end
    else
      return send_without_data(404, { errors: 'Record not found' })
    end
  end

  private

    def shop_owner_params
      params.require(:shop_owner).permit(:email, :password, :password_confirmation, :name, :phone)
    end

end
