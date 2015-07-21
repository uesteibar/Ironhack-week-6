require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "creation" do
    before(:each) do
      @match_params = {
        winner: Player.create(name: "winner"),
        loser: Player.create(name: "loser"),
        winner_faction: Faction.create(name: "Orcs"),
        loser_faction: Faction.create(name: "Elves")
      }
    end

    after(:each) do
      Match.destroy_all
    end

    it "should create a match when all parameters are provided" do
      match = Match.create(@match_params)
      expect(match.id).not_to be_falsy
    end

    it "should NOT create a match when winner is missing" do
      expect do
        Match.create!(@match_params.merge({winner: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create a match when loser is missing" do
      expect do
        Match.create!(@match_params.merge({loser: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create a match when winner_faction is missing" do
      expect do
        Match.create!(@match_params.merge({winner_faction: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create a match when loser_faction is missing" do
      expect do
        Match.create!(@match_params.merge({loser_faction: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
