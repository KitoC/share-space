class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :address, as: :addressable
  has_many :photos, as: :photoable
  has_many :sharespace_venues
  has_many :bookings
  after_create :tasks

  private
  def tasks
    set_address
  end

  def set_address
    self.build_address.save
  end
end
