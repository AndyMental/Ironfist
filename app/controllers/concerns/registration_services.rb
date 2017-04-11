module RegistrationServices
  include SharedHelpers
  include UserHelpers

  # Send the confirmation OTP
  def self.send_confirmation_otp(resource)
    otp = resource.generate_otp
    ConfirmationMailer.send_otp(resource, otp).deliver_now
  end

  # Verify the OTP
  def self.verify_otp(resource, otp)
    if resource.otp == otp
      resource.otp_verified_at = Time.now
      resource.save
      return 'success'
    else
      return 'fail'
    end
  end

end
