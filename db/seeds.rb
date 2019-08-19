# Organizations
10.times do
  name = Faker::Book.title
  mission = Faker::Books::Lovecraft.paragraph
  Organization.create(name: name, mission: mission)
  p "10 articles created"
end

# Projects
5.times do
  Organization.all.each do |org|
    organization = org
    description = Faker::Books::Lovecraft.paragraph
    Project.create(organization: organization, description: description)
  end
  p "5 projects created"
end

# Users
1.times do
  email = "john@google.com"
  username = "JohnGoogle"
  password = "password"
  first_name = "John"
  last_name = "Google"
  User.create(email: email, username: username, password: password, first_name: first_name, last_name: last_name)
  p "1 user created"
end
