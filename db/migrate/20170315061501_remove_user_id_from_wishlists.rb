class RemoveUserIdFromWishlists < ActiveRecord::Migration
  def change
    remove_column :wishlists, :user_id, :integer
  end
end
