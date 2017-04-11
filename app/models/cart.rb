# == Schema Information
#
# Table name: carts
#
#  id          :integer          not null, primary key
#  shop_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#
# Indexes
#
#  index_carts_on_customer_id  (customer_id)
#

class Cart < ActiveRecord::Base

  # relations
  belongs_to :customer
  has_many :cart_items
  has_many :products, -> { select('products.*, cart_items.quantity as quantity') }, through: :cart_items

end
