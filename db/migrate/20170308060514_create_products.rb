class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true
      t.string :name
      t.float :price
      t.boolean :private
      t.text :description
      t.integer :count
      t.boolean :is_featured
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
