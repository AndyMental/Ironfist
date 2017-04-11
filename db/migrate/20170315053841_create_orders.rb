class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.integer :customer_id
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
