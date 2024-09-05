require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe "associations" do
    it "belongs to a user" do
      association = Collection.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many collection_video_games" do
      association = Collection.reflect_on_association(:collection_video_games)
      expect(association.macro).to eq(:has_many)
    end

    it "has many video_games through collection_video_games" do
      association = Collection.reflect_on_association(:video_games)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:collection_video_games)
    end
  end

  describe "validations" do
    it "is valid with a valid collection_type and user" do
      collection = build(:collection)
      expect(collection).to be_valid
    end

    it "is invalid without a collection_type" do
      collection = build(:collection, collection_type: nil)
      expect(collection).not_to be_valid
      expect(collection.errors[:collection_type]).to include("can't be blank")
    end

    it "is invalid with an invalid collection_type" do
      collection = build(:collection, collection_type: 'InvalidType')
      expect(collection).not_to be_valid
      expect(collection.errors[:collection_type]).to include("is not included in the list")
    end
  end
end
