class CreateProductReviews < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.text :content
      t.float :rating
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
