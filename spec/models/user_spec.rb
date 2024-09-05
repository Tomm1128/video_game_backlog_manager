require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it "has many collections" do
      user = User.reflect_on_association(:collections)
      expect(user.macro).to eq(:has_many)
    end

    it "has many reviews" do
      user = User.reflect_on_association(:reviews)
      expect(user.macro).to eq(:has_many)
    end

    it "has many video games through collections" do
      user = User.reflect_on_association(:video_games)
      expect(user.macro).to eq(:has_many)
      expect(user.options[:through]).to eq(:collections)
    end

    it "has many reviewed video games through reviews" do
      user = User.reflect_on_association(:reviewed_video_games)
      expect(user.macro).to eq(:has_many)
      expect(user.options[:through]).to eq(:reviews)
      expect(user.options[:source]).to eq(:video_game)
    end
  end

  describe "validations" do
    let(:user) { User.new(username: "testuser", bio: "This is a test bio", password: "password", password_confirmation: "password") }

    it "is valid with a valid username, bio, password, and password_confirmation" do
      expect(user).to be_valid
    end

    it "is invalid without a username" do
      user.username = nil
      expect(user).not_to be_valid
    end

    it "is invalid without a bio" do
      user.bio = nil
      expect(user).not_to be_valid
    end

    it "is invalid without a password" do
      user.password = nil
      expect(user).not_to be_valid
    end

    it "is invalid if password_confirmation doesn't match password" do
      user.password_confirmation = "wrongpassword"
      expect(user).not_to be_valid
    end
  end

  describe "#collection_by_type" do
    let(:user) { create(:user) }
    let(:collection_type) { "Completed" }
    let!(:collection) { create(:collection, user: user, collection_type: collection_type) }
    let!(:video_game) { create(:video_game) }
    let!(:collection_video_game) { create(:collection_video_game, collection: collection, video_game: video_game) }

    it "returns video games for the specified collection type" do
      result = user.collection_by_type(collection_type)
      expect(result).to include(video_game)
    end

    it "returns nil if no collections of that type exist" do
      result = user.collection_by_type("Wishlist")
      expect(result).to be_nil
    end
  end

  describe "#reviewed_video_game?" do
    let(:user) { create(:user) }
    let(:video_game) { create(:video_game) }
    let!(:review) { create(:review, user: user, video_game: video_game) }

    it "returns true if the user has reviewed the video game" do
      expect(user.reviewed_video_game?(video_game.id)).to be true
    end

    it "returns false if the user has not reviewed the video game" do
      other_video_game = create(:video_game)
      expect(user.reviewed_video_game?(other_video_game.id)).to be false
    end
  end
end
