class TournamentsController < ApplicationController
  def index
    render :index
  end

  def api_index
    render json: Tournament.all
  end

  def api_create
    tournament = Tournament.new(tournament_params)
    unless tournament.valid?
      render status: 400, json: tournament.errors
      return
    end
    tournament.save
    render status: 201, json: tournament
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
