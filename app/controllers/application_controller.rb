class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if:  :devise_controller?
    include Pundit
    protect_from_forgery  

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
        flash[:alert] = "You are not authorized!"
        redirect_to '/'
    end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :type ])
        end
        
        def after_sign_in_path_for(current_user)
            if current_user.type == "Admin"
                admin_path(current_user)
            else
                events_path
            end
        end
    
end
