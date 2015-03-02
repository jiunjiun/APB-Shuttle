class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_url

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

    def redirect_url
      dev_url = 'apb.dev'
      new_redirect_url = "http://apb-shuttle.info"
      redirect_to "#{new_redirect_url}#{request.original_fullpath}" if request.host != dev_url
    end
end
