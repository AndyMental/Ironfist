class Api::V1::ShopsController < ApplicationController

  def create
    # Create shop
    @shop = Shop.new(shop_params)
    if @shop.save
      send_with_data(200, @shop, success_message)
    else
      send_without_data(422, set_errors(@shop))
    end
  end

  def suspend
    # Suspend shop
    @shop = Shop.find(params[:id])
    deactivate(@shop)
    send_without_data(200, {success: 'Shop suspended'})
  end

  def enable
    # Enabler shop
    @shop = Shop.find(params[:id])
    activate(@shop)
    send_with_data(200, @shop, {success: 'Shop activated'})
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :domain, :theme_id, :shop_owner_id)
    end

end
