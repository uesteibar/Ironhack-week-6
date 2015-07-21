class Match < ActiveRecord::Base
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  belongs_to :winner_faction, class_name: "Faction"
  belongs_to :loser_faction, class_name: "Faction"

  validates_presence_of :winner, :loser, :winner_faction, :loser_faction
end
