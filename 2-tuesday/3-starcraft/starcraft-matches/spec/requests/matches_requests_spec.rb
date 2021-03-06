require 'rails_helper'

RSpec.describe MatchesController, type: :request do
    before(:each) do
      match_params = {
        winner: Player.create(name: "uesteibar"),
        loser: Player.create(name: "someone"),
        winner_faction: Faction.create(name: "Orcs"),
        loser_faction: Faction.create(name: "Elves")
      }
      Match.create(match_params)
      @match = Match.create(match_params)
    end

  describe "GET /players/:id/matches" do
    it "returns a list of matches of a certain player" do
      get "/players/#{@match.winner_id}/matches"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data.length).to eq 2
    end

    it 'responds successfully with an HTTP 200 status code' do
      get "/players/#{@match.winner_id}/matches"
      expect(response).to be_success
      expect(response).to have_http_status 200
    end
  end

  describe "GET /factions/:id/matches" do
    it "returns a list of matches of a certain faction" do
      get "/factions/#{@match.winner_id}/matches"
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body)
      expect(data["matches"].length).to eq 2
      expect(data["winning_ratio"]).to eq 1
    end

    it 'responds successfully with an HTTP 200 status code' do
      get "/factions/#{@match.winner_id}/matches"
      expect(response).to be_success
      expect(response).to have_http_status 200
    end
  end
end
