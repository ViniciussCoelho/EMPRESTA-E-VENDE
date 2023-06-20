class Community < ApplicationRecord
  has_one_attached :image
  has_many :community_participants
end
