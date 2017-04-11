class AddShopOwnerIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :shop_owner_id, :integer
  end
end
