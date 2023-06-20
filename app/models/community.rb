class Community < ApplicationRecord
  has_one_attached :image
  has_many :community_participants, dependent: :destroy
  has_many :posts, through: :community_participants, source: :posts, dependent: :destroy
end
