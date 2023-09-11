class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_devise_parameters, if: :devise_controller?
end
