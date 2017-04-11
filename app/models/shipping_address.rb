# == Schema Information
#
# Table name: shipping_addresses
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  address     :text
#  city        :string
#  state       :string
#  zipcode     :string
#  country     :string
#  phone       :string
#  email       :string
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_shipping_addresses_on_customer_id  (customer_id)
#

class ShippingAddress < ActiveRecord::Base

  # relation
  belongs_to :customer
  
  # validations
  validates_presence_of :first_name, :last_name, :address, :city, :state, :country, :zipcode
  validates :address, length: {minimum: 10}
  validates :zipcode, length: {minimum: 3}
  validates :email, presence: true, format: { with: Devise::email_regexp }, unless: :user_id
  validates :phone, presence: true, uniqueness: true, numericality: true, length: { minimum: 10, maximum: 15 }, unless: :user_id

end
