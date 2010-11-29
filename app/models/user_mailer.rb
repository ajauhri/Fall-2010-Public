class UserMailer < ActionMailer::Base
  
  # Forms the various parameters of the email sent to reset password
  # Input params: User

  def password_reset_instructions(user)
    subject    'Instructions to reset PET password'
    recipients user.email
    from       'PET 1.3 Staff <pet.1.3@sv.cmu.edu>'
    sent_on    Time.now
    
    body       :user => user, :edit_password_url => edit_password_url(user.perishable_token, :host => "localhost:3000")
  end

end
