
bands = [
  "Linkin Park",
  "Jessie J",
  "Ella Eyre",
  "Shlomo and the lip factory",
]

cities = [
  City.create(name: "Barcelona"),
  City.create(name: "Donosti"),
  City.create(name: "Bilbo")
]

venues = [
  "Carrer something",
  "Parque pedralbes",
  "Somewhere in the middle"
]

usernames = [
  "someone",
  "jonhdoe",
  "uesteibar"
]

comments = [
  "Love it!",
  "It sucks!",
  "I couldn't go...",
  "Best show ever!"
]

dates = [
  1.day.from_now,
  1.day.ago,
  1.month.from_now,
  Date.today
]

5.times do
  bands.each do |band|
    concert = Concert.create(
    band: band,
    city_id: cities.sample.id,
    venue: venues.sample,
    date: dates.sample,
    price: Random.rand(10...100),
    poster: File.new("#{Rails.root}/db/seed-files/#{band}.jpg"),
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )

    Random.rand(1..20).times do |time|
      concert.comments.create(username: usernames.sample, content: comments.sample)
    end
  end
end
