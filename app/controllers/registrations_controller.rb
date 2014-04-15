class RegistrationsController < ApplicationController

  def new
    @organisation = Organisation.new
    #@organisation.organisation_name = 'Siimbyant'
  end

  def create
    Rails.logger.debug("+ + + ++ + + + + + + + + #{params}")
    @organisation = Organisation.new organisation_params

    if @organisation.save
      flash[:notice] = t('.fn_created')
      LoginMailer.login_email(@organisation).deliver
      redirect_to nace_codes_new_path
    else
      render action: :new
    end
  end

  def authenticate
    @organisation = Organisation.find_by login_token: params[:login_token]
    #organisation = Organisations.authenticatable.find_by_login_token!(params[:id])
    # TODO Force-log-in order.seller
    #redirect_to nace_codes_new_path
  end

  private
  def organisation_params
    # http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    params.require(:organisation).permit!
  end

end
