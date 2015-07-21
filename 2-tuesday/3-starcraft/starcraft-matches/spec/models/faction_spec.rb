require 'rails_helper'

RSpec.describe Faction, type: :model do
  describe "creation" do
    before(:each) do
      @faction_params = {
        name: "Orcs"
      }
    end

    it "should create a faction when all parameters are provided" do
      faction = Faction.create(@faction_params)
      expect(faction.id).not_to be_falsy
    end

    it "should NOT create a faction when name is repeated" do
      Faction.create(@faction_params)
      expect do
        Faction.create!(@faction_params)
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create a faction when name is empty" do
      expect do
        Faction.create!(@faction_params.merge({name: ""}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create a faction when name is nil" do
      expect do
        Faction.create!(@faction_params.merge({name: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
