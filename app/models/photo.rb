class Photo < ApplicationRecord
  mount_uploader :image, PhotoImageUploader
  belongs_to :photoable, polymorphic: true, optional: true

  after_create :tasks

  def tasks
    profile_check
  end

  def profile_check
    if self.photoable.photos.count <= 1
      self.photoable.update(profile_photo: self.id)
    end
  end
end
