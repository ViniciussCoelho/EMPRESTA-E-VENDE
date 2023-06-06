class Post < ApplicationRecord
  belongs_to :community_participant
  has_one_attached :image
end
