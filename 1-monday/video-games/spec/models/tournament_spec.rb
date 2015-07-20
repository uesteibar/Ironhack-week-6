require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe 'creation' do
    it 'should create a tournament when a name is provided' do
      tournament = Tournament.create(name: "super tournament")
      expect(tournament.id).not_to be_falsy
    end

    it 'should NOT create a tournament when name is nil' do
      tournament = Tournament.create(name: nil)
      expect(tournament.id).to be_falsy
    end

    it 'should NOT create a tournament when name is empty' do
      tournament = Tournament.create(name: "")
      expect(tournament.id).to be_falsy
    end
  end
end
