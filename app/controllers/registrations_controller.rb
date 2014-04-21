class RegistrationsController < ApplicationController

  def new
    @organisation = Organisation.new
  end

  def edit
    @organisation = Organisation.find_by_login_token!(params[:id])
  end

  def create
    Rails.logger.debug("+ + + ++ + + + + + + + + #{params}")
    @organisation = Organisation.new organisation_params

    if @organisation.save
      LoginMailer.login_email(@organisation).deliver
      redirect_to nace_codes_new_path
    else
      render action: :new
    end
  end

  def update
    @organisation = Organisation.find_by_login_token!(params[:id])
    if @organisation.update_attributes(organisation_params)
      redirect_to nace_codes_new_path
    else
      render action: :edit
    end
  end

  private
  def organisation_params
    # http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    params.require(:organisation).permit!
  end

end
