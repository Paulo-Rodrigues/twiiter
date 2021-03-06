class User < ApplicationRecord
  has_many :twiits, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :create_user_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def like(likeable)
    likes.create!(likeable: likeable)
  end

  def unlike(likeable)
    likes.delete(Like.where(user: self, likeable: likeable))
  end

  def liked?(likeable)
    likes.map(&:likeable_id).include?(likeable.id)
  end

  private

  def create_user_profile
    create_profile!
  end
end
