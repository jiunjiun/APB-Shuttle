class ApplicationController < ActionController::Base
  include Mengpaneel::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_url
  before_action :mixpanel_tracker
  before_filter :set_cache_buster

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

    def redirect_url
      keep_url = ['apb.dev', 'apb-shuttle.info']
      new_redirect_url = "https://apb-shuttle.info"
      redirect_to "#{new_redirect_url}#{request.original_fullpath}" if !keep_url.include? request.host
    end

    def mixpanel_tracker
      @tracker = Mixpanel::Tracker.new(Settings.mixpanel.token)

      @tracker.track('apb', 'Rails', {'Controller#Action': "#{params[:controller]}\##{params[:action]}", Controller: params[:controller], Action: params[:action]})
    end

    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
end
