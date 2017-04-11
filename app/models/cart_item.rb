# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default("1")
#
# Indexes
#
#  index_cart_items_on_cart_id  (cart_id)
#

class CartItem < ActiveRecord::Base

  # relations
  belongs_to :cart
  belongs_to :product

end
