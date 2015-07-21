class MatchesController < ApplicationController
  def index
    matches = Match.find_by_player(params[:player_id])
    render status: 200, json: matches
  end
end
