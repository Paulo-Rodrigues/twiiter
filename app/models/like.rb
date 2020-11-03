class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :user_id, presence: true,
                      uniqueness: { scope: %i[likeable_id likeable_type], message: 'Já curtido' }
  validates :likeable_id, presence: true,
                          uniqueness: { scope: %i[user_id likeable_type], message: 'Já curtido' }
  validates :likeable_type, presence: true,
                            uniqueness: { scope: %i[user_id likeable_id], message: 'Já curtido' }
end
