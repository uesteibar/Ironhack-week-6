require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    city = City.create(name: "Barcelona")
    @concert = Concert.create(
      band: 'Jessie J',
      venue: 'Parque Pedralbes',
      city_id: city.id,
      price: 20,
      date: 1.week.from_now,
      description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    )
  end

  describe 'POST #create' do
    it 'creates a comment' do
      params = {
        username: "uesteibar",
        content: "COOOOOL"
      }
      expect do
        post :create, comment: params, concert_id: @concert.id
      end.to change(Comment, :count).by(1)
    end
  end
end
