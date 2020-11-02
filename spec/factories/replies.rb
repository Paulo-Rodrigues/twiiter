FactoryBot.define do
  factory :reply do
    body { 'MyText' }
    user { nil }
    replieable { nil }
  end
end
