require 'rails_helper'

RSpec.describe MatchesController, type: :request do
  describe "GET /players/:id/matches" do
    before(:each) do
      match_params = {
        winner: Player.create(name: "uesteibar"),
        loser: Player.create(name: "someone"),
        winner_faction: Faction.create(name: "Orcs"),
        loser_faction: Faction.create(name: "Elves")
      }
      @match = Match.create(match_params)
    end

    it "returns a list of matches of a certain player" do
      get "/players/#{@match.winner_id}/matches"
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(data.length).to eq 1
    end
  end
end
