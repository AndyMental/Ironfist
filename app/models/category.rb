# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_active  :boolean          default("t")
#

class Category < ActiveRecord::Base

  #relations
  has_many :subcategories
  has_many :products

end
