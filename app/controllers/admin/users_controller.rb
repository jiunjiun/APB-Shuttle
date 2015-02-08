class Admin::UsersController < AdminController
  before_filter :set_user, only: [:destroy]

  def index
    @users = User.offset(1).all
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
