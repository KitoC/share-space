class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :destroy_booking?


    protected
    # This method allows custom parameters to be passed through and applied too the custom columns setup for the User model through devise.
    def configure_permitted_parameters
      attributes = [:first_name, :last_name, :street_address, :address_id, :overall_rating, :dob, :description, :phone_number, :emergency_contact_name, :emergency_contact_number, :emergency_contact_relationship, :gender_id, :occupation_id, :profile_photo]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

    # Throws up a warning for users trying to perform actions they are not authorized for.
    def not_authorised
      flash[:notice] = 'You are not authorized to perform this action!'
      redirect_back(fallback_location: root_path)
    end

    # Just a refactor of the authorization code to make it variable in the model_controllers.rb.
    def authorization(action, object = "default - missing something?")
      if action == "create"
        not_authorised and return unless current_user.can_create?
      elsif action == "update"
        not_authorised and return unless current_user.can_update?(object)
      elsif action == "destroy"
        not_authorised and return unless current_user.can_destroy?(object)
      elsif action == "owner"
        not_authorised and return unless current_user.owner?(object)
      elsif action == "admin"
        not_authorised and return unless current_user.admin_only
      end
    end

    # This checks to make sure the dates that the user has inputted are in the correct sequence (e.g. date_from: 20-01-2018, date_to: 15-01-2018 will return an incorrect date input notification for the user trying to create a booking.) This is to prevent people abusing the booking system and creating -$ transactions.
    def correct_dates?(object)
      object.date_from <= object.date_to
    end

    # This is the error message thrown up if the dates are incorrect.
    def incorrect_dates
      flash[:notice] = 'The dates you have entered are the wrong way around! Please try again.'
      redirect_back(fallback_location: root_path)
    end


    # This action destroys the user's last booking if they haven't paid for it yet.
    def destroy_booking?
      if user_signed_in? && current_user.bookings.last != nil
        current_user.bookings.where(paid: false).destroy_all if (Time.now - current_user.bookings.last.created_at ) / 60 >= 5
      end
    end

    


end
