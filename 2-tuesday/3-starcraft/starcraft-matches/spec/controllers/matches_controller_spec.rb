require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      match_params = {
        winner: Player.create(name: "uesteibar"),
        loser: Player.create(name: "someone"),
        winner_faction: Faction.create(name: "Orcs"),
        loser_faction: Faction.create(name: "Elves")
      }
      @match = Match.create(match_params)
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :index, player_id: @match.winner_id
      expect(response).to be_success
      expect(response).to have_http_status 200
    end
  end
end
