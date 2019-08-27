Engagement.destroy_all
Project.destroy_all
Representative.destroy_all
User.destroy_all
Organization.destroy_all
Notification.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:engagements)
ActiveRecord::Base.connection.reset_pk_sequence!(:projects)
ActiveRecord::Base.connection.reset_pk_sequence!(:representatives)
ActiveRecord::Base.connection.reset_pk_sequence!(:users)
ActiveRecord::Base.connection.reset_pk_sequence!(:organizations)

#Default Dummy Organization for Admin users
# ID 1
Organization.create!(
                    name: "admin",
                    mission: "NA"
)
#Default Dummy Organization for Dev users
# ID 2
Organization.create!(
                    name: "Independent volunteer",
                    mission: "NA"
                  )
# Organizations for users associated with an organization
# ID 3
Organization.create!(
                    name: 'Montreal Clothes Closet',
                    mission: 'To help everyone dress for success',
                    address: "5505 St Laurent Blvd, Montreal",
                    logo: Faker::Company.logo
                  )

# ID 4
Organization.create!(
                    name: 'The Winnipeg Food Pantry',
                    mission: 'Food is a human right!',
                    address: '561 Bannerman Ave, Winnipeg',
                    logo: Faker::Company.logo
                )
p "2 organizations created"

# Users - Admin
email = "admin@test.com"
username = "admin"
password = "password"
first_name = "Admin"
last_name = "Test"
admin = true
developer = false
group = "admin"
organization = Organization.find(1)
new_admin = User.create!(
                        organization: organization,
                        email: email,
                        username: username,
                        password: password,
                        first_name: first_name,
                        last_name: last_name,
                        group: group,
                        admin: admin,
                        developer: developer
                      )
p "1 admin user created"

# Users - NGO
email = "ngo@test.com"
username = "ngo"
password = "password"
first_name = "NGO"
last_name = "Test"
group = "ngo"
organization = Organization.find(3)
new_rep = User.create!(
                      email: email, username: username,
                      password: password,
                      first_name: first_name,
                      last_name: last_name,
                      admin: admin,
                      developer: developer,
                      group: group,
                      organization: organization,
                    )
p "1 ngo user created"

# 2 Projects per organization
Project.create(
              organization: Organization.find(4), # The Winnipeg Food Pantry
              description: "Website to get new clients",
              title: "Food pantry website",
              user: new_rep
            )

Project.create(
              organization: Organization.find(4), # The Winnipeg Food Pantry
              description: "Database to organize our inventory",
              title: "Food pantry database",
              user: new_rep
            )

Project.create(
              organization: Organization.find(3), # Montreal Clothes Closet
              description: "Website to highlight our beautiful clothes",
              title: "Beautiful clothing website",
              user: new_rep
            )

Project.all.each do |project|
  p project.title
end
