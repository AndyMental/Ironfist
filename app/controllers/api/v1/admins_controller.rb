class Api::V1::AdminsController < ApplicationController
  include UserHelpers

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      # VerificationServices.call(@admin)
      send_with_data(200, send_public_data(@admin), {success: 'Please verify the OTP sent'})
    else
      send_without_data(422, set_errors(@admin))
    end
  end

  def update
    begin
      @admin = ShopOwner.find(params[:id])
      if @admin.update(admin_params)
        send_with_data(200, send_public_data(@admin), {success: 'Update successful'})
      else
        send_without_data(422, set_errors(@admin))
      end
    rescue ActiveRecord::RecordNotFound
      send_without_data(404, { errors: 'Shop Owner not found' })
    end
  end

  private

    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation, :name, :phone)
    end

end
