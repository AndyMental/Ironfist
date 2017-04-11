class AddCustomerIdToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :customer_id, :integer
  end
end
