require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  describe "associations" do
    it "has many reviews" do
      video_game = VideoGame.reflect_on_association(:reviews)
      expect(video_game.macro).to eq(:has_many)
    end

    it "has many collection_video_games" do
      video_game = VideoGame.reflect_on_association(:collection_video_games)
      expect(video_game.macro).to eq(:has_many)
    end

    it "has many collections through video games" do
      video_game = VideoGame.reflect_on_association(:collections)
      expect(video_game.macro).to eq(:has_many)
      expect(video_game.options[:through]).to eq(:collection_video_games)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      video_game = build(:video_game)
      expect(video_game).to be_valid
    end

    it 'is not valid without a name' do
      video_game = build(:video_game, name: nil)
      expect(video_game).not_to be_valid
      expect(video_game.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a description' do
      video_game = build(:video_game, description: nil)
      expect(video_game).not_to be_valid
      expect(video_game.errors[:description]).to include("can't be blank")
    end

    it 'is not valid without a release_date' do
      video_game = build(:video_game, release_date: nil)
      expect(video_game).not_to be_valid
      expect(video_game.errors[:release_date]).to include("can't be blank")
    end

    it 'is not valid without a developer' do
      video_game = build(:video_game, developer: nil)
      expect(video_game).not_to be_valid
      expect(video_game.errors[:developer]).to include("can't be blank")
    end

    it 'is not valid without a publisher' do
      video_game = build(:video_game, publisher: nil)
      expect(video_game).not_to be_valid
      expect(video_game.errors[:publisher]).to include("can't be blank")
    end

    it 'is not valid without a platform' do
      video_game = build(:video_game, platform: nil)
      expect(video_game).not_to be_valid
      expect(video_game.errors[:platform]).to include("can't be blank")
    end
  end

  describe '.top_rated' do
    let!(:high_rated_video_game) { create(:video_game) }
    let!(:low_rated_video_game) { create(:video_game) }

    before do
      create(:review, video_game: high_rated_video_game, rating: 5)
      create(:review, video_game: low_rated_video_game, rating: 1)
      create(:review, video_game: high_rated_video_game, rating: 4) # Average = 4.5
    end

    it 'returns video games sorted by average rating in descending order' do
      expect(VideoGame.top_rated).to eq([high_rated_video_game, low_rated_video_game])
    end
  end

  describe '#average_rating' do
    let(:video_game) { create(:video_game) }

    it 'returns the average rating of reviews for the video game' do
      create(:review, video_game: video_game, rating: 5)
      create(:review, video_game: video_game, rating: 3)
      expect(video_game.average_rating).to eq(4.0)
    end

    it 'returns 0 if the video game has no reviews' do
      expect(video_game.average_rating).to eq(0)
    end
  end
end
