class Sharespace < ApplicationRecord
  belongs_to :sharespace_venue
  has_many :photos, as: :photoable

end
