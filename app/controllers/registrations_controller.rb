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
      # this should be another route
      redirect_to new_registration_path
    else
      render action: :new
    end
  end


  private

  def organisation_params
    # http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    params.require(:organisation).permit!
  end
end
