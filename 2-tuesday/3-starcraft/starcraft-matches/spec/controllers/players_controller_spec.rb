require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  before(:each) do
    match_params = {
      winner: Player.create(name: "uesteibar"),
      loser: Player.create(name: "someone"),
      winner_faction: Faction.create(name: "Orcs"),
      loser_faction: Faction.create(name: "Elves")
    }

    Match.create(match_params)
    @player = Match.create(match_params).winner
  end

  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: @player.id
      expect(response).to be_success
      expect(response).to have_http_status 200
    end
  end
end
