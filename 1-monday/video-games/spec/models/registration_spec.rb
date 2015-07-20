require 'rails_helper'

RSpec.describe Registration, type: :model do
  before(:each) do
    @user_one = User.create name: "uesteibar"
    @user_two = User.create name: "someone"
    @tournament_one = Tournament.create name: "super tournament"
    @tournament_two = Tournament.create name: "hyper tournament"
  end
  describe 'user - tournament' do
    it 'should register a user in a single tournament' do
      @user_one.registrations.create(tournament_id: @tournament_one.id)
      expect(@user_one.registrations.first.tournament).to eq @tournament_one
    end

    it 'should register a user in many tournaments' do
      @user_one.registrations.create(tournament_id: @tournament_one.id)
      @user_one.registrations.create(tournament_id: @tournament_two.id)
      expect(@user_one.registrations.size).to eq 2
      expect(@user_one.registrations.first.tournament).to eq @tournament_one
      expect(@user_one.registrations.last.tournament).to eq @tournament_two
    end

    it 'should NOT register a user in the same tournament two times' do
      @user_one.registrations.create(tournament_id: @tournament_one.id)
      expect do
        @user_one.registrations.create!(tournament_id: @tournament_one.id)
      end.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe 'tournament - user' do
    it 'should register a many user in a single tournament' do
      @tournament_one.registrations.create(user_id: @user_one.id)
      @tournament_one.registrations.create(user_id: @user_two.id)
      expect(@tournament_one.registrations.size).to eq 2
      expect(@tournament_one.registrations.first.user).to eq @user_one
      expect(@tournament_one.registrations.last.user).to eq @user_two
    end
  end
end
