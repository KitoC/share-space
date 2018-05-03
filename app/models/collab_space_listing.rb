class CollabSpaceListing < ApplicationRecord

  belongs_to :user
  has_one :address, as: :addressable

  after_create :tasks

  private
  def tasks
    set_address
  end

  def set_address
    self.build_address.save
  end
end
