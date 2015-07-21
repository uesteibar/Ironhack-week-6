class Match < ActiveRecord::Base
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  belongs_to :winner_faction, class_name: "Faction"
  belongs_to :loser_faction, class_name: "Faction"

  validates_presence_of :winner, :loser, :winner_faction, :loser_faction

  def self.find_by_owner(owner_params)
    case owner_params.first
    when :player_id
      self.find_by_player(owner_params.second)
    when :faction_id
      self.find_by_faction(owner_params.second)
    end
  end

  private

  def self.find_by_player(player_id)
    where("winner_id = ? OR loser_id = ?", player_id, player_id)
  end

  def self.find_by_faction(faction_id)
    where("winner_faction_id = ? OR loser_faction_id = ?", faction_id, faction_id)
  end
end
