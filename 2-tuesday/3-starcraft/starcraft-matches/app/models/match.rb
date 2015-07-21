class Match < ActiveRecord::Base
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  validates_presence_of :winner, :loser
end
