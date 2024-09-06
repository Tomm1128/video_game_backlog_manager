require 'rails_helper'

RSpec.describe CollectionVideoGame, type: :model do
  describe "associations" do
    it "belongs to a collection" do
      association = CollectionVideoGame.reflect_on_association(:collection)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to a video_game" do
      association = CollectionVideoGame.reflect_on_association(:video_game)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe "validations" do
    it "is valid with a collection_id, video_game_id, and playtime" do
      collection_video_game = create(:collection_video_game)
      expect(collection_video_game).to be_valid
    end

    it "is invalid without a collection_id" do
      collection_video_game = build(:collection_video_game, collection: nil)
      expect(collection_video_game).not_to be_valid
      expect(collection_video_game.errors[:collection]).to include("must exist")
    end

    it "is invalid without a video_game_id" do
      collection_video_game = build(:collection_video_game, video_game: nil)
      expect(collection_video_game).not_to be_valid
      expect(collection_video_game.errors[:video_game]).to include("must exist")
    end

    it "is invalid without playtime" do
      collection_video_game = build(:collection_video_game, playtime: nil)
      expect(collection_video_game).not_to be_valid
      expect(collection_video_game.errors[:playtime]).to include("can't be blank")
    end
  end
end
