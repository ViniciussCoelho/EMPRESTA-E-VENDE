class CommunityParticipant < ApplicationRecord
  belongs_to :community
  belongs_to :user
  has_many :posts, dependent: :destroy
end
