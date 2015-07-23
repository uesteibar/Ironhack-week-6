require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'creates a user' do
      params = {
        username: "uesteibar",
        email: "uesteibar@email.com",
        password: "1234567890",
        password_confirmation: "1234567890"
      }
      expect do
        post :create, user: params
      end.to change(User, :count).by(1)
      expect(User.last.username).to eq params[:username]
    end
  end
end
