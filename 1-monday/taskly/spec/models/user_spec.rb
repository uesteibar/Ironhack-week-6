require "rails_helper"

RSpec.describe User, type: :model do
  describe "creation" do
    it 'should create a user when all data is correct' do
      user = User.create(name: "superman", email: "superemail@example.com")
      expect(user.id).to be_truthy
    end

    it 'should NOT create a user when name is nil' do
      user = User.create(name: nil, email: "superemail@example.com")
      expect(user.id).to be_falsy
    end

    it 'should NOT create a user when email is nil' do
      user = User.create(name: "superman", email: nil)
      expect(user.id).to be_falsy
    end

    it 'should NOT create a user name already exists' do
      User.create(name: "superman", email: "superemail@example.com")
      user = User.create(name: "superman", email: "email@example.com")
      expect(user.id).to be_falsy
    end

    it 'should NOT create a user email already exists' do
      User.create(name: "superman", email: "superemail@example.com")
      user = User.create(name: "superuser", email: "superemail@example.com")
      expect(user.id).to be_falsy
    end
  end
end
