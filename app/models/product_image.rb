# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  image      :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductImage < ActiveRecord::Base

  # relations
  belongs_to :product

  # uploader for image
  mount_uploader :image, ImageUploader

end
