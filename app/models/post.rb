class Post < ApplicationRecord
  belongs_to :community_participant
  has_many :likeds, dependent: :destroy
  has_one_attached :image
end
