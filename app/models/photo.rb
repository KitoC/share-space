class Photo < ApplicationRecord
  mount_uploader :image, PhotoImageUploader
  belongs_to :photoable, polymorphic: true, optional: true
end
