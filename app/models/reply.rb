class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :replieable, polymorphic: true
  has_many :replies, dependent: :destroy, as: :replieable
  has_many :likes, dependent: :destroy, as: :likeable

  validates :user_id, :replieable_id, :body, presence: true
  validates :body, length: { in: 1..280 }
end
