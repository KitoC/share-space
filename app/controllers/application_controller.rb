class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      attributes = [:first_name, :last_name, :street_address, :location_address_id, :overall_rating, :dob, :description, :phone_number, :emergency_contact_name, :emergency_contact_number, :emergency_contact_relationship, :gender_id, :occupation_id]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end
