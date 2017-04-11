class AddIsActiveToShops < ActiveRecord::Migration
  def change
    add_column :shops, :is_active, :boolean, default: true
  end
end
