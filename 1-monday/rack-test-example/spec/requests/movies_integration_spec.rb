require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "Create - Retrieve - Update - Delete" do
    it 'should success going through the whole workflow' do
      movie_params = {
        title: "The Avengers"
      }

      post movies_path, movie: movie_params, format: "json"
      movie = JSON.parse response.body
      expect(movie["title"]).to eq movie_params[:title]

      get movie_path(movie["id"]), format: "json"
      movie_clone = JSON.parse response.body
      expect(movie_clone).to eq movie

      updated_movie_params = {
        title: "The Avengers 2"
      }

      put movie_path(movie["id"]), movie: updated_movie_params, format: "json"
      movie_clone = JSON.parse response.body
      expect(movie_clone["title"]).to eq updated_movie_params[:title]
      expect(movie_clone["title"]).not_to eq movie["title"]

      delete movie_path(movie["id"]), format: "json"
      expect(response).to have_http_status 204

      expect do
        get movie_path(movie["id"]), format: "json"
      end.to raise_error ActiveRecord::RecordNotFound

    end
  end
end
