require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      @users = []
      @users << User.create(name: "superuser", email: "root@example.com")
      @users << User.create(name: "anotherone", email: "ao@example.com")
    end

    it 'should respond successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'should return a json file with all the users' do
      get :index
      expect(response.body).to eq @users.to_json
    end
  end

  describe 'GET #show' do
    before(:each) do
      @user = User.create(name: "superuser", email: "root@example.com")
    end

    it 'should respond successfully with an HTTP 200 status code' do
      get :show, id: @user.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'should return a json file with the user' do
      get :show, id: @user.id
      expect(response.body).to eq @user.to_json
    end
  end

  describe 'POST #create' do
    it 'should respond successfully with an HTTP 201 status code' do
      params = { name: "superman", email: "super@example.com" }
      post :create, user: params

      expect(response).to be_success
      expect(response.code.to_i).to eq(201)
    end

    it 'should create a user' do
      params = { name: "superman", email: "super@example.com" }
      expect do
        post :create, user: params
      end.to change(User, :count).by(1)
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @user = User.create(name: "superuser", email: "root@example.com")
    end

    it 'should NOT create a new user' do
      params = { name: "superman" }
      expect do
        put :update, id: @user.id, user: params
      end.to change(User, :count).by(0)
    end

    it 'should update de user' do
      params = { name: "superman" }
      put :update, id: @user.id, user: params
      @user.reload
      expect(@user.name).to eq params[:name]
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @user = User.create(name: "superuser", email: "root@example.com")
    end

    it 'should delete de user' do
      expect do
        delete :destroy, id: @user.id
      end.to change(User, :count).by(-1)
    end
  end
end
