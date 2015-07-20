require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before(:each) do
    @user = User.create(name: "superuser", email: "root@example.com")
  end

  describe 'GET #index' do
    before(:each) do
      @user.tasks.create(description: "save the world")
    end

    it 'should respond successfully with an HTTP 200 status code' do
      get :index, user_id: @user.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'should respond with an HTTP 404 status code when the user does not exist' do
      get :index, user_id: @user.id - 1
      expect(response.code.to_i).to eq(404)
    end

    it 'should return a json file with all the tasks owned by the given user' do
      get :index, user_id: @user.id
      expect(response.body).to eq @user.tasks.to_json
    end
  end

  describe "POST #create" do
    it 'should respond successfully with an HTTP 201 status code' do
      params = { description: "save the world" }
      post :create, task: params, user_id: @user.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(201)
    end

    it 'should create a task' do
      params = { description: "save the world"}
      expect do
        post :create, task: params, user_id: @user.id
      end.to change(Task, :count).by(1)
    end
  end

  describe "POST #show" do
    before(:each) do
      @task = @user.tasks.create(description: "save the world")
    end

    it 'should respond successfully with an HTTP 200 status code' do
      get :show, id: @task.id, user_id: @user.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'should return a json file with the task' do
      get :show, id: @task.id, user_id: @user.id
      expect(response.body).to eq @task.to_json
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @task = @user.tasks.create(description: "save the world")
    end

    it 'should NOT create a new task' do
      params = { description: "save the world again" }
      expect do
        put :update, id: @task.id, user_id: @user.id, task: params
      end.to change(Task, :count).by(0)
    end

    it 'should update de task' do
      params = { description: "save the world again" }
      put :update, id: @task.id, user_id: @user.id, task: params
      @task.reload
      expect(@task.description).to eq params[:description]
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @task = @user.tasks.create(description: "save the world")
    end

    it 'should delete the task' do
      expect do
        delete :destroy, id: @task.id, user_id: @user.id
      end.to change(Task, :count).by(-1)
    end
  end
end
