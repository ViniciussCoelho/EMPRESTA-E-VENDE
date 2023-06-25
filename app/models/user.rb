class User < ApplicationRecord
  has_many :community_participants
  has_many :communities, through: :community_participants
  has_many :likeds
  has_one_attached :image

  validates :first_name, :last_name, :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def liked?(post)
    likeds.exists?(post: post)
  end
end
