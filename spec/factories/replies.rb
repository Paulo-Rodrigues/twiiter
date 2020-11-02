FactoryBot.define do
  factory :reply do
    body { 'MyReply' }
    user
    replieable
  end
end
