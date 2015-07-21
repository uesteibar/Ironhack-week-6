require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "creation" do
    before(:each) do
      @player_params = {
        name: "uesteibar"
      }
    end

    it 'should create a player if name is provided' do
      player = Player.create!(@player_params)
      expect(player.id).not_to be_falsy
    end

    it 'should NOT create a player if name is empty' do
      expect do
        Player.create!(@player_params.merge({name: ""}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it 'should NOT create a player if name is nil' do
      expect do
        Player.create!(@player_params.merge({name: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
