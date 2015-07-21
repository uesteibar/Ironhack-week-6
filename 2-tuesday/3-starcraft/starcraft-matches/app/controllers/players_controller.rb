class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @player_matches = Match.find_by_player(params[:id])
  end
end
