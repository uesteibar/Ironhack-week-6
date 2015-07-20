require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      @users = []
      @users << User.create(name: "superuser", email: "root@example.com")
      @users << User.create(name: "anotherone", email: "ao@example.com")
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'returns a json file with all the users' do
      get :index
      expect(response.body).to eq @users.to_json
    end
  end

  describe 'POST #create' do
    it 'creates a user' do
      params = {
        name: "superman",
        email: "super@example.com"
      }
      expect do
        post :create, user: params
      end.to change(User, :count).by(1)
    end
  end
end
