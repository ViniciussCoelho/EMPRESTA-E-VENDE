class Liked < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def community
    post.community_participant.community
  end
end
