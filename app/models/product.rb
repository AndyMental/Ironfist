# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  subcategory_id :integer
#  name           :string
#  price          :float
#  private        :boolean
#  description    :text
#  count          :integer
#  is_featured    :boolean
#  is_active      :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  shop_id        :integer
#
# Indexes
#
#  index_products_on_category_id     (category_id)
#  index_products_on_subcategory_id  (subcategory_id)
#

class Product < ActiveRecord::Base

  # relations
  belongs_to :category
  belongs_to :subcategory
  has_many :product_properties, dependent: :nullify
  has_many :product_images, dependent: :nullify
  has_many :product_reviews, dependent: :nullify

  # nested attributes
  accepts_nested_attributes_for :product_properties, :product_images, :product_reviews,
    allow_destroy: true, reject_if: :all_blank

  # validations
  validates_presence_of :category_id, :subcategory_id, :name, :price, :description, :shop_id

end
