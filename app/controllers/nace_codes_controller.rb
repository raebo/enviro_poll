class NaceCodesController < ApplicationController

  def edit
    @nace_codes = NaceCode
    @organisation = Organisation.find(session[:current_organisation_id])
  end

  def update
    @organisation = Organisation.find(session[:current_organisation_id])

    if (!params[:organisation].blank? && @organisation.update_attributes(organisation_params))
      redirect_to static_pages_questions_info_path
    else
      flash.now[:notice] = t('.choose')
      @nace_codes = NaceCode
      render action: :edit
    end
  end

   private
  def organisation_params
    params.require(:organisation).permit!
  end

end
