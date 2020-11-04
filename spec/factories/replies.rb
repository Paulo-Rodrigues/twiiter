FactoryBot.define do
  factory :reply do
    body { 'MyReply' }
    user
    replieable { create(:twiit) }
  end
end
