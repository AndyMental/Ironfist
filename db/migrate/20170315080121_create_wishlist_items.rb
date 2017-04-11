class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.integer :wishlist_id
      t.integer :product_id

      t.timestamps null: false
    end

    add_index :wishlist_items, :wishlist_id
  end
end
