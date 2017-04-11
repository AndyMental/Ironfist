# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  customer_id         :integer
#  shop_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  shipping_address_id :integer
#

class Order < ActiveRecord::Base

  # relations
  has_many :order_items
  belongs_to :customer

end
