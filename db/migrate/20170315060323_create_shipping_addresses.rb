class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :phone
      t.string :email
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
