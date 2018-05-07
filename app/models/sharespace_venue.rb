class SharespaceVenue < ApplicationRecord
  resourcify

  belongs_to :user
  has_one :address, as: :addressable
  has_many :photos, as: :photoable
  has_many :reviews, as: :reviewable
  has_many :sharespaces

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
