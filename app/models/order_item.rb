# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default("1")
#
# Indexes
#
#  index_order_items_on_order_id  (order_id)
#

class OrderItem < ActiveRecord::Base

  # relations
  belongs_to :order

end
