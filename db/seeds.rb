
#Default Dummy Organization for Dev users
Organization.create!(name: 'default', mission: 'none')

# Organizations for users associated with an organization
Organization.create(name: 'Valve', mission: 'To help the hungry people!', address: "561 Bannerman Ave, Winnipeg", logo: Faker::Company.logo)
Organization.create(name: 'Ubisoft', mission: 'To provide electricity to people!', address: '5505 St Laurent Blvd, Montreal', logo: Faker::Company.logo)
p "2 organizations created"

# Users - Admin
email = "admin@test.com"
username = "admin"
password = "password"
first_name = "Admin"
last_name = "Test"
admin = true
developer = false
new_admin = User.create!(organization: Organization.find(2), email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 admin user created"
# new_admin = User.new(organization_id: Organization.all.sample, email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)

# Users - NGO
email = "ngo@test.com"
username = "ngo"
password = "password"
first_name = "NGO"
last_name = "Test"
admin = false
developer = false
new_rep = User.create!(organization: Organization.find(2), email: email, username: username, password: password, first_name: first_name, last_name: last_name, admin: admin, developer: developer)
p "1 ngo_rep user created"

# 2 Projects per organization
Project.create(organization: Organization.find(2), description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote, title: Faker::Job.title, user: new_rep)
Project.create(organization: Organization.find(2), description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote, title: Faker::Job.title, user: new_rep)
Project.create(organization: Organization.find(2), description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote, title: Faker::Job.title, user: new_rep)
# Organization.create(name: 'Valve', mission: "make money", logo: Faker::Company.logo)

Project.all.each do |project|
  p project.title
end

# Set staff membership
test_ngo = Organization.find(2)
p "test_org created: #{test_ngo}"
test_rep = Representative.create(organization: test_ngo, user: new_rep)
p "test_rep created: #{test_rep}"
