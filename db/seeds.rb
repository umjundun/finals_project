#Default Organization for Dev users
Organization.create!(name: 'default', mission: 'none')

# Organizations
4.times do
  name = Faker::Company.name
  mission = Faker::Company.catch_phrase
  logo = Faker::Company.logo
  address = Faker::Address.full_address
  lat = Faker::Address.latitude
  long = Faker::Address.longitude
  Organization.create(name: name, mission: mission, latitude: lat, longitude: long, logo: logo, address: address)
end
p "4 organizations created"

# 2 Projects per organization
2.times do
  Organization.all.each do |org|
    organization = org
    title = Faker::Job.title
    description = Faker::Movies::HitchhikersGuideToTheGalaxy.quote
    Project.create(organization: organization, description: description, title: title)
  end
end
# Organization.create(name: 'Valve', mission: "make money", logo: Faker::Company.logo)
p "2 organizations created"

# Users - Admin
email = "admin@test.com"
username = "admin"
password = "password"
first_name = "Admin"
last_name = "Test"
admin = true
developer = false
new_admin = User.create!(organization: Organization.all.sample, email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 admin user created"
# new_admin = User.new(organization_id: Organization.all.sample, email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)

# Users - Dev
email = "dev@test.com"
username = "developer"
password = "password"
first_name = "Dev"
last_name = "Test"
admin = false
developer = true
new_dev = User.create!(organization: Organization.all.sample, email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 developer user created"

# Users - NGO
email = "ngo@test.com"
username = "ngo"
password = "password"
first_name = "NGO"
last_name = "Test"
admin = false
developer = false
new_rep = User.create!(organization: Organization.all.sample, email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 ngo_rep user created"




# 2 Projects per organization
2.times do
  Organization.all.each do |org|
    organization = org
    title = Faker::Job.title
    description = Faker::Movies::HitchhikersGuideToTheGalaxy.quote
    Project.create!(organization: organization, description: description, title: title, user: new_rep)
  end
end
p "2 projects created"
Project.all.each do |project|
  p project.title
end

# Set staff membership
test_ngo = Organization.find(4)
p "test_org created: #{test_ngo}"
test_rep = Representative.create(organization: test_ngo, user: new_rep)
p "test_rep created: #{test_rep}"

