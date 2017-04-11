class Api::V1::ProductsController < ApplicationController
  include ProductHelpers

  def index
    # Get list of products with properties
    @products = JSON.parse(Product.all.to_json(include: [:product_properties, :product_images]))
    send_with_data(200, @products, success_message)
  end

  def create
    # Create product with properties
    @product = Product.new(product_params)
    if @product.save
      send_with_data(200, send_with_details(@product), success_message)
    else
      send_without_data(422, set_errors(@product))
    end
  end

  def show
    # Get a product with its properties by id
    begin
      @product = Product.find(params[:id])
      send_with_data(200, send_with_details(@product), success_message)
    rescue ActiveRecord::RecordNotFound
      send_without_data(404, {errors: "Couldn't find record with id #{params[:id]}"})
    end
  end

  def update
    begin
      @product = Product.find(params[:id])
      if @product.update(product_params)
        send_with_data(200, send_with_details(@product), {success: 'Update successful'})
      else
        send_without_data(422, set_errors(@product))
      end
    rescue ActiveRecord::RecordNotFound
      send_without_data(404, {errors: "Couldn't find record with id #{params[:id]}"})
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy!
      send_without_data(204, { errors: 'Product successfully removed!' })
    else
      send_without_data(404, set_errors(@product))
    end
  end

  private

  def product_params
    params.require(:product).permit(:category_id, :subcategory_id, :name, :price, :private, :description,
     :count, :is_featured, :is_active, :shop_id, product_properties_attributes: [
      :product_id, :property_name, :property_value, :_destroy], product_images_attributes: [
        :remote_image_url, :product_id, :_destroy])
  end

end
