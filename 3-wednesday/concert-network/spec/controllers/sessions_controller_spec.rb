require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    before(:each) do
      @user = User.create(
        username: "uesteibar",
        email: "uesteibar@email.com",
        password: "1234567890",
        password_confirmation: "1234567890"
      )
    end

    it 'should set a session cookie' do
      post :create, email: @user.email, password: @user.password
      expect(session[:user_id]).not_to be_falsy
    end
  end

  describe 'GET #destroy' do
    before(:each) do
      @user = User.create(
        username: "uesteibar",
        email: "uesteibar@email.com",
        password: "1234567890",
        password_confirmation: "1234567890"
      )
      post :create, email: @user.email, password: @user.password
    end

    it 'should clear the session cookie' do
      get :destroy
      expect(session[:user_id]).to be_falsy
    end
  end
end
