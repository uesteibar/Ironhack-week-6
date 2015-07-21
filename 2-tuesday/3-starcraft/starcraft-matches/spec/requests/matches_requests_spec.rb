require 'rails_helper'

RSpec.describe MatchesController, type: :request do
    before(:each) do
      match_params = {
        winner: Player.create(name: "uesteibar"),
        loser: Player.create(name: "someone"),
        winner_faction: Faction.create(name: "Orcs"),
        loser_faction: Faction.create(name: "Elves")
      }
      @match = Match.create(match_params)
    end

  describe "GET /players/:id/matches" do
    it "returns a list of matches of a certain player" do
      get "/players/#{@match.winner_id}/matches"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data.length).to eq 1
    end
  end

  describe "GET /factions/:id/matches" do
    it "returns a list of matches of a certain faction" do
      get "/factions/#{@match.winner_id}/matches"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data.length).to eq 1
    end
  end
end
