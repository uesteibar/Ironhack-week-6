require 'rails_helper'

RSpec.describe "Tournaments", type: :request do
  describe "GET /api/tournaments" do
    before(:each) do
      @tournament = Tournament.create name: "Super tournament"
      @tournament = Tournament.create name: "Mega tournament"
    end

    it "returns a list of tournaments" do
      get '/api/tournaments', format: :json
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.length).to eq 2
    end
  end
end
