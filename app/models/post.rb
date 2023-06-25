class Post < ApplicationRecord
  belongs_to :community_participant
  has_many :likeds, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images
end
