class Twiit < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy, as: :replieable

  validates :user_id, presence: true
  validates :text, presence: true, length: { in: 1..280 }

  def owner?(current_user)
    user == current_user
  end
end
