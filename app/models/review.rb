class Review < ApplicationRecord
  resourcify
  belongs_to :user
end
