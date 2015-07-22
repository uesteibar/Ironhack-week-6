require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    it 'creates a concert' do
      params = {
        name: "Barcelona"
      }
      expect do
        post :create, city: params
      end.to change(City, :count).by(1)
    end
  end
end
