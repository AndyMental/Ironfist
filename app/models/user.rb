class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => Devise::email_regexp

  # Generate OTP
  def generate_otp
    self.otp = rand(100000..999999)
    save
    return otp
  end

end
