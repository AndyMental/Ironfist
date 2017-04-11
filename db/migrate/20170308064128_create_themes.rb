class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name, unique: true, null: false

      t.timestamps null: false
    end
  end
end
