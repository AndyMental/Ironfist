# == Schema Information
#
# Table name: product_reviews
#
#  id         :integer          not null, primary key
#  content    :text
#  rating     :float
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductReview < ActiveRecord::Base

  # relation
  belongs_to :product

end
