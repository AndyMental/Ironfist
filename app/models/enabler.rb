# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  name            :string
#  phone           :string
#  type            :string
#  otp             :string
#  otp_verified_at :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  auth_token      :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_phone  (phone) UNIQUE
#

class Enabler < User

  # validations
  validates :phone, presence: true, uniqueness: true, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :name, presence: true, length: { minimum: 3 }

end
