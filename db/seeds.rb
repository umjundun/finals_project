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
clothes_closet = Organization.create!(
                    name: 'Montreal Clothes Closet',
                    mission: 'To help everyone dress for success',
                    address: "5505 St Laurent Blvd, Montreal",
                    logo: Faker::Company.logo
                  )

# ID 4
food_pantry = Organization.create!(
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
email = "ngo@test.com"
username = "ngo"
password = "password"
first_name = "NGO"
last_name = "Test"
group = "ngo"
organization = clothes_closet
clothes_closet_rep = User.create!(
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

# Users - NGO The Winnipeg Food Pantry
email = "food_pantry@test.com"
username = "food_pantry"
password = "password"
first_name = "Winnipeg"
last_name = "Food Pantry"
group = "ngo"
organization = food_pantry
food_pantry_rep = User.create!(
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
              organization: food_pantry, # The Winnipeg Food Pantry
              description: "Website to get new clients",
              title: "Food pantry website",
              user: food_pantry_rep,
              active: true
            )

Project.create(
              organization: food_pantry, # The Winnipeg Food Pantry
              description: "Database to organize our inventory",
              title: "Food pantry database",
              user: food_pantry_rep,
              active: true
            )

Project.create(
              organization: clothes_closet, # Montreal Clothes Closet
              description: "Website to highlight our beautiful clothes",
              title: "Beautiful clothing website",
              user: clothes_closet_rep,
              active: true
            )

Project.create(
              organization: clothes_closet, # Montreal Clothes Closet
              description: "Banner image",
              title: "Banner image",
              user: clothes_closet_rep,
              active: false
            )

Project.create(
              organization: clothes_closet, # Montreal Clothes Closet
              description: "Another project",
              title: "Another project",
              user: clothes_closet_rep,
              active: true
            )
