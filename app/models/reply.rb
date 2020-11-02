class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :replieable, polymorphic: true
  has_many :replies, dependent: :destroy, as: :replieable

  validates :user_id, :replieable_id, :body, presence: true
  validates :body, length: { in: 1..280 }
end
