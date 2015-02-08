class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :init_seesion

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

    def init_seesion
      reset_session if session[:depart] <= 1.minutes.ago && request.fullpath == root_path if session[:depart]
      session[:now_num] ||= BusCache.where({bus_id: Bus.recent_depart.id}).first.id.to_i
    end
end
