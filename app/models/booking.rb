class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :share_space
end
