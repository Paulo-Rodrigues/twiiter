require 'rails_helper'

RSpec.describe Reply, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:replieable_id) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(1) }
    it { is_expected.to validate_length_of(:body).is_at_most(280) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:replieable) }
    it { is_expected.to have_many(:replies).dependent(:destroy) }
  end
end
