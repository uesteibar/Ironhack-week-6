require 'rails_helper'

RSpec.describe City, type: :model do
  before(:each) do
    @city_name = "Barcelona"
  end

  describe "cities - creation" do
    it 'should create a city when the name is filled' do
      expect(City.create(name: @city_name).id).not_to be_falsy
    end

    it 'should NOT create a city when the name is nil' do
      expect do
        City.create!(name: nil)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a city when the name is empty' do
      expect do
        City.create!(name: "")
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT create a city when there already is another with the same name' do
      City.create(name: @city_name)
      expect do
        City.create!(name: @city_name)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
