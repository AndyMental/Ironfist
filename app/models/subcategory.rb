# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_active   :boolean          default("t")
#
# Indexes
#
#  index_subcategories_on_category_id  (category_id)
#

class Subcategory < ActiveRecord::Base

  # relations
  belongs_to :category
  has_many :products

end
