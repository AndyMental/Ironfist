# == Schema Information
#
# Table name: wishlists
#
#  id          :integer          not null, primary key
#  shop_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#
# Indexes
#
#  index_wishlists_on_customer_id  (customer_id)
#

class Wishlist < ActiveRecord::Base

  # relations
  has_many :wishlist_items
  belongs_to :customer

end
