FactoryBot.define do
  factory :profile do
    first_name { 'MyString' }
    last_name { 'MyString' }
    bio { 'MyText' }
    user
  end
end
