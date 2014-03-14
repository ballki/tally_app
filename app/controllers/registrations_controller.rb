class RegistrationsController < Devise::RegistrationsController
  def update
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # For Rails 3
    # account_update_params = params[:business]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @business = Business.find(current_business.id)
    if @business.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the business bypassing validation in case his password changed
      sign_in @business, :bypass => true
      redirect_to after_update_path_for(@business)
    else
      render "edit"
    end
  end
end