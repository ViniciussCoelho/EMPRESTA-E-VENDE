class User < ApplicationRecord
  has_many :community_participants
  has_many :communities, through: :community_participants

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
