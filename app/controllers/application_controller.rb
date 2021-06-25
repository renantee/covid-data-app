class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_country_paramaters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :country_id, :password, :password_confirmation, :is_admin)
    end
  end

  def configure_country_paramaters
    @countries = Country.all
    @default_user_country = Country.find_by(iso2: "PH")
  end
end
