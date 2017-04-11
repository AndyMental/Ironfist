class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :domain, unique: true, null: false
      t.integer :theme_id
      t.integer :shop_owner_id

      t.timestamps null: false
    end
  end
end
