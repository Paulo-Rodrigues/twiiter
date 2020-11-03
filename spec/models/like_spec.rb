require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:likeable) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:likeable_id) }
    it { is_expected.to validate_presence_of(:likeable_type) }

    it 'valid like like just one time' do
      user = create(:user)
      twiit = create(:twiit)
      like = Like.create(user: user, likeable: twiit)

      expect(like).to be_valid
      expect(Like.count).to eq(1)
      expect(user.likes.count).to eq(1)
      expect(twiit.likes.count).to eq(1)
    end

    it 'invalid like, trying more than one like at same twiit' do
      user = create(:user)
      twiit = create(:twiit)
      Like.create(user: user, likeable: twiit)
      other_like = Like.new(user: user, likeable: twiit)

      expect(other_like).not_to be_valid
    end
  end
end
