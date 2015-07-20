class TournamentsController < ApplicationController
  def index
    render :index
  end

  def api_index
    render json: Tournament.all
  end
end
