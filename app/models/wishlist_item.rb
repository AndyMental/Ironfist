# == Schema Information
#
# Table name: wishlist_items
#
#  id          :integer          not null, primary key
#  wishlist_id :integer
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_wishlist_items_on_wishlist_id  (wishlist_id)
#

class WishlistItem < ActiveRecord::Base

  # relations
  belongs_to :wishlist

end
