class LoginForgottenMailer < ActionMailer::Base
  default from: "alexandra.goldmann92@gmail.com"

  def login_forgotten_email(organisation)
  	@organisation = organisation
  	@url = authenticate_dashboard_url(@organisation.login_token, host: 'localhost:3000')
  	# host must be changed!
  	mail to: organisation.user_email, subject: 'EnviroPoll Login-Link'
  end
end
