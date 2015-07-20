
users = [
  {name: "baptiste", email: "bbrassart@example.com"},
  {name: "uesteibar", email: "uesteibar@example.com"},
  {name: "john doe", email: "jd@example.com"}
]

users.each do |user|
  User.create(user)
end
