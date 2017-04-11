# == Schema Information
#
# Table name: product_properties
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  property_name  :string
#  property_value :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_product_properties_on_product_id  (product_id)
#

class ProductProperty < ActiveRecord::Base

  # relations
  belongs_to :product

end
