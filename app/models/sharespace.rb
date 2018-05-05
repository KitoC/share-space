class Sharespace < ApplicationRecord
  resourcify
  belongs_to :sharespace_venue
  has_many :photos, as: :photoable
  has_many :bookings


end
