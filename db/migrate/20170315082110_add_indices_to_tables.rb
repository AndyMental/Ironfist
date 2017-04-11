class AddIndicesToTables < ActiveRecord::Migration
  def change
    add_index :carts, :customer_id
    add_index :wishlists, :customer_id
  end
end
