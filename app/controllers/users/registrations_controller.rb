class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  before_filter :authenticate_user!

  before_filter :not_found, only: [:destroy]
  layout 'admin'

  def new
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
  end

  private
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def after_sign_up_path_for(resource)
      admin_users_path
    end
end