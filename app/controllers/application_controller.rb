class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :business_details

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :logo, :email, :password, :password_confirmation, :street_address, :phone, :manager, :reward, :req_visits, :marketing_package, :photo)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :logo, :email, :password, :password_confirmation, :street_address, :phone, :manager, :reward, :req_visits, :marketing_package, :photo)
    end
  end

  def business_details
    if current_business
      business_details = {
        :name => current_business.name,
        :logo => current_business.logo,
        :business => current_business,
        :email    => current_business.email,
        :street_address => current_business.street_address,
        :phone    => current_business.phone,
        :manager  => current_business.manager,
        :reward   => current_business.reward,
        :req_visits => current_business.req_visits,
        :marketing_package => current_business.marketing_package,
        :photo  => current_business.photo
      }
    end
  end


end