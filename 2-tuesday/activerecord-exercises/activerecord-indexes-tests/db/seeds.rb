
(1000000000000000000).times do |num|
  puts "creating stuff"
  User.create(name: "name#{num}")
  UserWithIndex.create(name: "name#{num}")
end
