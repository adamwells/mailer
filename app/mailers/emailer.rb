class Emailer < ActionMailer::Base
  default from: "noreply@example.com"

  def send_out(email)
  	@email = email
  	mail(to: @email.to, subject: @email.subject)
  end
end
