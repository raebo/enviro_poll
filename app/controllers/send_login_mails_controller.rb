class SendLoginMailsController < ApplicationController
  def new
  	@organisation = Organisation.new
  end

  def create
    if @organisation = Organisation.find_by_user_email(params[:organisation][:user_email])
    LoginForgottenMailer.login_forgotten_email(@organisation).deliver
    redirect_to send_login_mails_new_path, notice: "Die E-Mail wurde versendet."
    else
    redirect_to send_login_mails_new_path, notice: "Diese E-Mail-Adresse ist nicht registriert."
    end
  end

end
