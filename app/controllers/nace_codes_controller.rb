class NaceCodesController < ApplicationController

  def edit
    @nace_codes = NaceCode
    @organisation = Organisation.find(session[:current_organisation_id])
  end

  def update
    @organisation = Organisation.find(session[:current_organisation_id])

    if @organisation.update_attributes(organisation_params)
      redirect_to nace_codes_edit_path
    else
      render action: :edit
    end
  end

   private
  def organisation_params
    params.require(:organisation).permit!
  end

end
