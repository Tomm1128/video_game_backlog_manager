FactoryBot.define do
  factory :user do
    username { "Tuj" }
    password { "password" }
    password_confirmation { "password" }
    bio { "This is a bio" }
  end
end
