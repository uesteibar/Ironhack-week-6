require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  before(:each) do
    @user = User.create(
    username: "admin",
    email: "admin@live.com",
    password: "admin",
    password_confirmation: "admin",
    role: "admin"
    )
    session[:user_id] = @user.id
  end

  describe 'GET #index' do
    context 'when the user is the admin' do
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

    context 'when the user is not the admin' do
      before(:each) do
        @user.role = nil
        @user.save
      end

      it 'responds successfully with an HTTP 302 status code' do
        get :index
        expect(response).not_to be_success
        expect(response.code.to_i).to eq(302)
      end

      it 'redirects to root' do
        get :index
        expect(response).to redirect_to('/')
      end
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
