Engagement.destroy_all
Project.destroy_all
Representative.destroy_all
User.destroy_all
Organization.destroy_all

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

# Users - NGO Montreal Clothes Closet
clothes_closet_rep = User.create!(
                      email: "ngo@test.com",
                      username: "ngo",
                      password: "password",
                      first_name: "NGO",
                      last_name: "Test",
                      admin: false,
                      organization: clothes_closet,
                      developer: false,
                      group: "ngo",
                    )

# Users - NGO The Winnipeg Food Pantry
food_pantry_rep = User.create!(
                      email: "food_pantry@test.com",
                      username: "food_pantry",
                      password: "password",
                      first_name: "Winnipeg",
                      last_name: "Food Pantry",
                      admin: false,
                      developer: false,
                      group: "ngo",
                      organization: food_pantry,
                    )
p "2 NGO users created"

# Users - Devs
User.create!(
              email: "dev@test.com",
              username: "dev",
              password: "password",
              first_name: "dev",
              last_name: "test",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
            )
User.create!(
              email: "dev2@test.com",
              username: "dev2",
              password: "password",
              first_name: "dev",
              last_name: "test",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
            )
User.create!(
              email: "dev3@test.com",
              username: "dev3",
              password: "password",
              first_name: "dev",
              last_name: "test",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
            )
User.create!(
              email: "dev4@test.com",
              username: "dev4",
              password: "password",
              first_name: "dev",
              last_name: "test",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
            )
User.create!(
              email: "dev5@test.com",
              username: "dev5",
              password: "password",
              first_name: "dev",
              last_name: "test",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
            )
p "5 devs created"

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

 p "5 engagements created"
