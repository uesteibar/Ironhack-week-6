require 'rails_helper'

RSpec.describe Concert, type: :model do
  describe 'concert - creation' do
    before(:each) do
      @band = 'Jessie J'
      @venue = 'Parque Pedralbes'
      @city_id = City.create(name: "Barcelona").id
      @price = 20
      @date = 1.week.from_now
      @description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    end

    it 'should create a concert when all the parameters are correct' do
      expect(Concert.create(
        band: @band,
        venue: @venue,
        city_id: @city_id,
        price: @price,
        date: @date,
        description: @description
      ).id).not_to be_falsy
    end

    it 'should NOT create a concert when any parameters are missing' do
      expect do
        Concert.create!(
          band: @band,
          venue: @venue,
          price: @price,
          date: @date,
          description: @description)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
