class Admin::Settings::BusesController < AdminController
  before_action :set_photo, only: [:edit, :update]
  def index
    @photos = Photo.all
  end

  def edit
  end

  def update
    # render text: photo_params
    if @photo.update(photo_params)
      redirect_to admin_settings_buses_path
    else
      render :edit
    end
  end

  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:file)
    end
end
