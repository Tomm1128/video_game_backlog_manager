require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "associations" do
    it "belongs to a user" do
      association = Review.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to a video game" do
      association = Review.reflect_on_association(:video_game)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe "validations" do
    it "is valid with valid attributes" do
      review = build(:review)
      expect(review).to be_valid
    end

    it "is invalid without a title" do
      review = build(:review, title: nil)
      expect(review).not_to be_valid
      expect(review.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a body" do
      review = build(:review, body: nil)
      expect(review).not_to be_valid
      expect(review.errors[:body]).to include("can't be blank")
    end

    it "is invalid without a rating" do
      review = build(:review, rating: nil)
      expect(review).not_to be_valid
      expect(review.errors[:rating]).to include("can't be blank")
    end

    it "is invalid with a rating less than 0" do
      review = build(:review, rating: -1)
      expect(review).not_to be_valid
      expect(review.errors[:rating]).to include("must be greater than or equal to 0")
    end

    it "is invalid with a rating greater than 5" do
      review = build(:review, rating: 6)
      expect(review).not_to be_valid
      expect(review.errors[:rating]).to include("must be less than or equal to 5")
    end
  end
end
