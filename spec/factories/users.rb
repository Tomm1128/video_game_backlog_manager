FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    password { 'password123' }
    password_confirmation { 'password123' }
    bio { Faker::Quote.famous_last_words }
  end
end
