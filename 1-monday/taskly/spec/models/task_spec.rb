require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "creation" do
    before(:each) do
      @user = User.create(name: "superman", email: "superemail@example.com")
    end

    it 'should create a task when description and user_id are provided' do
      task = @user.tasks.create(description: "save the world")
      expect(task.id).not_to be_falsy
    end

    it 'should NOT create a task when description is missing' do
      expect do
        @user.tasks.create!
      end.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe "owner user destruction" do
    before(:each) do
      @user = User.create(name: "superman", email: "superemail@example.com")
      @user.tasks.create(description: "save the world")
    end
    
    it 'should delete all the tests when the owner user is deleted' do
      task = @user.tasks.first
      @user.destroy
      expect do
        task.reload
      end.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
