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
  email = Faker::Internet.email
  username = Faker::Internet.username
  password = "password"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(email: email, username: username, password: password, first_name: first_name, last_name: last_name)
  p "1 user created"
end
