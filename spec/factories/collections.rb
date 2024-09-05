FactoryBot.define do
  factory :collection do
    association :user
    collection_type { %w[In-Progress Completed Wishlist].sample }
  end
end
