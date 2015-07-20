require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a user when a name is provided' do
    user = User.create(name: "super tournament")
    expect(user.id).not_to be_falsy
  end

  it 'should NOT create a user when name is nil' do
    user = User.create(name: nil)
    expect(user.id).to be_falsy
  end

  it 'should NOT create a user when name is empty' do
    user = User.create(name: "")
    expect(user.id).to be_falsy
  end

  it 'should NOT create a user when name is repeated' do
    User.create(name: "super tournament")
    user = User.create(name: "super tournament")
    expect(user.id).to be_falsy
  end
end
