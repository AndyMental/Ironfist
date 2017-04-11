class Api::V1::CartsController < ApplicationController

  def add
    # Add items to cart
    # parameters - customer_id, product_id
    unless params[:customer_id] and params[:product_id]
      return send_without_data(422, { errors: 'Pass customer id and product id' })
    end
    @cart = Cart.find(params[:customer_id])
    @ci = @cart.cart_items.find_by(product_id: params[:product_id])
    if @ci
      @ci = @ci.update(quantity: @ci.quantity + 1)
    else
      @cart.cart_items.create(product_id: params[:product_id])
    end
    send_with_data(200, jsonify(@cart.products.tojson(include: :product_images)), success_message)
  end

  def update_quantity
    # Update quantity of items in cart
    # parameters - customer_id, product_id, quantity
    unless params[:product_id] and params[:customer_id] and params[:quantity]
      return send_without_data(422, { errors: 'Pass customer id, product id and quantity' })
    end
    @cart = Cart.find(params[:customer_id])
    @ci = @cart.cart_items.find_by(product_id: params[:product_id])
    if @ci
      @ci = @ci.update(quantity: params[:quantity])
      send_with_data(200, jsonify(@cart.products.tojson(include: :product_images)), success_message)
    else
      return send_without_data(404, { errors: 'Product not found' })
    end
  end

  def remove
    # remove items from cart
    # parameters - customer_id, product_id
    unless params[:customer_id] and params[:product_id]
      return send_without_data(422, { errors: 'Pass customer id and product id' })
    end
    @cart = Cart.find(params[:customer_id])
    @cart_item = Cart.cart_items.find_by(product_id: params[:product_id])
    if @cart_item
      send_with_data(200, @cart_item.destroy, success_message)
    else
      return send_without_data(404, { errors: 'Product not found' })
    end
  end

  def index
    unless params[:customer_id]
      return send_without_data(422, { errors: 'Pass customer id and product id' })
    end
    @cart = Cart.find(params[:customer_id])
    @products = jsonify(@cart.products.to_json(include: :product_images))
    send_with_data(200, @products, success)
  end

end
