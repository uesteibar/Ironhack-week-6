class Match < ActiveRecord::Base
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  belongs_to :winner_faction, class_name: "Faction"
  belongs_to :loser_faction, class_name: "Faction"

  validates_presence_of :winner, :loser, :winner_faction, :loser_faction

  def self.find_by_player(player_id)
    where("winner_id = ? OR loser_id = ?", player_id, player_id)
  end
end
