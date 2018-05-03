class CollabSpaceListing < ApplicationRecord

  belongs_to :user
  has_one :address, as: :addressable
  has_many :photos, as: :photoable
  after_create :tasks

  private
  def tasks
    set_address
    UserNotifierMailer.send_listing_creation_email(self.user).deliver
  end

  def set_address
    self.build_address.save
  end
end
