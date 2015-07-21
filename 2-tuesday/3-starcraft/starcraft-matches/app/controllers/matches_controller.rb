class MatchesController < ApplicationController
  def index
    matches = Match.find_by_owner(owner_params)
    render status: 200, json: matches
  end

  private

  def owner_params
    return [:player_id, params[:player_id]] if params.has_key?(:player_id)
    return [:faction_id, params[:faction_id]] if params.has_key?(:faction_id)
  end
end
