module ProductHelpers

  # Send with properties
  def send_with_details(product)
    JSON.parse(product.to_json(include: [:product_properties, :product_images,
      :product_reviews]))
  end

end
