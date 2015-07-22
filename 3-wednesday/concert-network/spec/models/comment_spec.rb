require 'rails_helper'

RSpec.describe Comment, type: :model do
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

  it 'should create a comment when username and content are given' do
    expect(@concert.comments.create(
    username: "uesteibar",
    content: "I loved it!"
    ).id).not_to be_falsy
  end

  it 'should NOT create a comment when username is nil' do
    expect do
      @concert.comments.create!(
        username: nil,
        content: "I loved it!")
      end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should NOT create a comment when username is empty' do
    expect do
      @concert.comments.create!(
        username: "",
        content: "I loved it!")
      end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should NOT create a comment when content is nil' do
    expect do
      @concert.comments.create!(
        username: "uesteibar",
        content: nil)
      end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should NOT create a comment when content is empty' do
    expect do
      @concert.comments.create!(
        username: "uesteibar",
        content: "")
      end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
