require 'rails_helper'

RSpec.describe User, type: :model do
  context 'respond_to' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:password) }
  end

  context 'associations' do
    it { is_expected.to have_many(:twiits).dependent(:destroy) }
    it { is_expected.to have_many(:replies).dependent(:destroy) }
    it { is_expected.to have_one(:profile).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end
end
