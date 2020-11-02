require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'profile attributes' do
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
    it { is_expected.to respond_to(:bio) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
