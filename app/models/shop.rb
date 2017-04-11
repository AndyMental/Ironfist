# == Schema Information
#
# Table name: shops
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  domain        :string           not null
#  theme_id      :integer
#  shop_owner_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  is_active     :boolean          default("t")
#

class Shop < ActiveRecord::Base

  # validations
  validates_presence_of :name, :domain, :theme_id
  validates_uniqueness_of :domain

  # relations
  belongs_to :shop_owner

end
