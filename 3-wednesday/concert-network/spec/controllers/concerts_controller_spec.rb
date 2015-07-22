require 'rails_helper'

RSpec.describe ConcertsController, type: :controller do
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

  describe 'GET #budget' do
    it 'responds successfully with an HTTP 200 status code' do
      get :budget
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'renders the index template' do
      get :budget
      expect(response).to render_template('budget')
    end
  end

  describe 'GET #show' do
    before(:each) do
      @concert = Concert.create(
        band: 'Jessie J',
        venue: 'Parque Pedralbes',
        city_id: City.create(name: "Barcelona").id,
        price: 20,
        date: 1.week.from_now,
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      )
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: @concert.id
      expect(response).to be_success
      expect(response.code.to_i).to eq(200)
    end

    it 'renders the show template' do
      get :show, id: 1
      expect(response).to render_template('show')
    end
  end

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
    it 'creates a concert' do
      params = {
        band: 'Jessie J',
        venue: 'Parque Pedralbes',
        city_id: City.create(name: "Barcelona").id,
        price: 20,
        date: 1.week.from_now,
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      }
      expect do
        post :create, concert: params
      end.to change(Concert, :count).by(1)
    end
  end
end
