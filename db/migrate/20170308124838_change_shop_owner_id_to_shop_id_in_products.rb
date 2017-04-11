class ChangeShopOwnerIdToShopIdInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :shop_owner_id, :shop_id
  end
end
