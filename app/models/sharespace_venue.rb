class SharespaceVenue < ApplicationRecord

  belongs_to :user
  has_one :address, as: :addressable
  has_many :photos, as: :photoable
  has_many :sharespaces
  after_create :tasks

  private
  def tasks
    set_address
  end

  def set_address
    self.build_address.save
  end
end