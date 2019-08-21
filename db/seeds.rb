# Organizations
15.times do
  name = Faker::Company.name
  mission = Faker::Company.catch_phrase
  logo = Faker::Company.logo
  Organization.create(name: name, mission: mission, logo: logo)
end
p "15 organizations created"

# 2 Projects per organization
4.times do
  Organization.all.each do |org|
    organization = org
    title = Faker::Company.bs
    description = Faker::Movies::HitchhikersGuideToTheGalaxy.quote
    Project.create(organization: organization, description: description, title: title)
  end
  p "20 projects created"
end

# Users - Admin
email = "admin@test.com"
username = "admin"
password = "password"
first_name = "Admin"
last_name = "Test"
admin = true
developer = false
new_admin = User.create(email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 admin user created"

# Users - Dev
email = "dev@test.com"
username = "developer"
password = "password"
first_name = "Dev"
last_name = "Test"
admin = false
developer = true
new_dev = User.create(email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 developer user created"

# Users - NGO
email = "ngo@test.com"
username = "ngo"
password = "password"
first_name = "NGO"
last_name = "Test"
admin = false
developer = false
new_rep = User.create(email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 ngo_rep user created"

# Set staff membership
test_ngo = Organization.find(3)
p "test_org created: #{test_ngo}"
test_rep = Representative.create(organization: test_ngo, user: new_rep)
p "test_rep created: #{test_rep}"
