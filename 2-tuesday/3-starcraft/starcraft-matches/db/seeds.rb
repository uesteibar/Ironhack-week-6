puts "----- creating players -----"

player_names = [
  "uesteibar",
  "someone",
  "someone else",
  "superuser"
]

player_names.each do |name|
  Player.create(name: name)
end

players = Player.all

puts "----- creating factions -----"

faction_names = [
  "orcs",
  "elves",
  "dark elves",
  "humans"
]

faction_names.each do |name|
  Faction.create(name: name)
end

factions = Faction.all

puts "----- creating matches -----"

10.times do
  Match.create(
  winner: players.sample,
  loser: players.sample,
  winner_faction: factions.sample,
  loser_faction: factions.sample,
  date: Date.today,
  duration: [1...100].sample
  )
end
