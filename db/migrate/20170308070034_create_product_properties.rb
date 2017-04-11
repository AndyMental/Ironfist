class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.references :product, index: true, foreign_key: true
      t.string :property_name
      t.string :property_value

      t.timestamps null: false
    end
  end
end
