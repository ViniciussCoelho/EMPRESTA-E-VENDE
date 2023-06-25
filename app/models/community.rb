class Community < ApplicationRecord
  has_one_attached :image
  has_many :community_participants, dependent: :destroy
  has_many :posts, through: :community_participants, source: :posts, dependent: :destroy
  has_many :community_modders, dependent: :destroy
  has_many :users, through: :community_modders
end
