require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before(:each) do
      @user_params = {
        username: "shannon",
        email: "shannon@example.com",
        password_digest: "1234567890"
      }
    end

    it "should create the user when all params are provided" do
      user = User.create(@user_params)
      expect(user.id).not_to be_falsy
    end

    it "should NOT create the user when username is empty" do
      expect do
        User.create!(@user_params.merge({username: ""}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create the user when username is nil" do
      expect do
        User.create!(@user_params.merge({username: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create the user when email is empty" do
      expect do
        User.create!(@user_params.merge({email: ""}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create the user when email is nil" do
      expect do
        User.create!(@user_params.merge({email: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create the user when password_digest is empty" do
      expect do
        User.create!(@user_params.merge({password_digest: ""}))
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should NOT create the user when password_digest is empty" do
      expect do
        User.create!(@user_params.merge({password_digest: nil}))
      end.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
