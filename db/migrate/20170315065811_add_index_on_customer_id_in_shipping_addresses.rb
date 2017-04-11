class AddIndexOnCustomerIdInShippingAddresses < ActiveRecord::Migration
  def change
    add_index :shipping_addresses, :customer_id
  end
end
