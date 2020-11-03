require 'rails_helper'

RSpec.describe Twiit, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_length_of(:text).is_at_least(1) }
    it { is_expected.to validate_length_of(:text).is_at_most(280) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:replies).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end
end
