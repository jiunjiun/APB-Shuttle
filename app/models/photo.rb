class Photo < ActiveRecord::Base
  mount_uploader :file, PhotoUploader

  after_destroy :remove_file
  before_save :update_file_attributes
  private
    def update_file_attributes
      if file.present? && file_changed?
        self.name         = file.filename
        self.content_type = file.content_type
        self.size         = file.size
      end
    end

    def remove_file
      FileUtils.remove_dir("#{Rails.root}/public/uploads/photo/file/#{id}", true)
    end
end
