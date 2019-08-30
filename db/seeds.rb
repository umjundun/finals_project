Engagement.destroy_all
Project.destroy_all
Representative.destroy_all
User.destroy_all
Organization.destroy_all
Notification.destroy_all
Message.destroy_all
Conversation.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:engagements)
ActiveRecord::Base.connection.reset_pk_sequence!(:projects)
ActiveRecord::Base.connection.reset_pk_sequence!(:representatives)
ActiveRecord::Base.connection.reset_pk_sequence!(:users)
ActiveRecord::Base.connection.reset_pk_sequence!(:organizations)

#Default Dummy Organization for Admin users
# ID 1
admin_org = Organization.create!(
                    name: "admin",
                    mission: "NA"
)
#Default Dummy Organization for Dev users
# ID 2
dev_org = Organization.create!(
                    name: "Independent volunteer",
                    mission: "NA"
                  )
# Organizations for users associated with an organization
# ID 3
clothes_closet = Organization.create!(
                    name: 'Montreal Clothes Closet',
                    mission: 'To help everyone dress for success',
                    address: "5505 St Laurent Blvd, Montreal",
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176760/clothes_closet_w4buuo.webp"
                  )
# ID 4
food_pantry = Organization.create!(
                    name: 'The Winnipeg Food Pantry',
                    mission: 'Food is a human right!',
                    address: '561 Bannerman Ave, Winnipeg',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176750/Food_Pantry_xqoodw.jpg"
                )
p "2 organizations created"

# Users - Admin
new_admin = User.create!(
                        email: "admin@test.com",
                        organization: admin_org,
                        username: "admin",
                        password: "password",
                        first_name: "Admin",
                        last_name: "Test",
                        group: "admin",
                        admin: true,
                        developer: false
                      )
p "1 admin user created"

# Users - NGO Montreal Clothes Closet
clothes_closet_rep = User.create!(
                      email: "becky@clothescloset.com",
                      username: "ngo",
                      password: "password",
                      first_name: "Becky",
                      last_name: "Test",
                      admin: false,
                      organization: clothes_closet,
                      developer: false,
                      group: "ngo",
                      remote_photo_url: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176925/Screen_Shot_2019-08-30_at_10.55.07_AM_obcjks.png"
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
              email: "bob@newdev.com",
              username: "dev",
              password: "password",
              first_name: "Bob",
              last_name: "Sherman",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
              remote_photo_url: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1566505936/luz9wt7bg6qqzktauf55.jpg",
            )
User.create!(
              email: "dev2@test.com",
              username: "dev2",
              password: "password",
              first_name: "Jasmine",
              last_name: "Princess",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
              remote_photo_url: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567177208/jasmine_nisamd.jpg"
            )
User.create!(
              email: "dev3@test.com",
              username: "dev3",
              password: "password",
              first_name: "Ariel",
              last_name: "Mermaid",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
              remote_photo_url: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567177222/ariel_n6vkuz.jpg"
            )
User.create!(
              email: "dev4@test.com",
              username: "dev4",
              password: "password",
              first_name: "Elsa",
              last_name: "Icequeen",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
              remote_photo_url: "https://lumiere-a.akamaihd.net/v1/images/6d7454cea6644379adc7e529c5790a28078a2823.jpeg"
            )
p "4 devs created"

# Projects
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
Project.create(
              organization: clothes_closet, # Montreal Clothes Closet
              description: "A third project",
              title: "A third project",
              user: clothes_closet_rep,
              active: true
            )
p "6 projects created"


#Create engagements
Engagement.create(
                status: "active",
                project: Project.find(4),
                user: User.find_by_email("dev2@test.com")
                )

Engagement.create(
                status: "active",
                project: Project.find(5),
                user: User.find_by_email("dev2@test.com")
                )

Engagement.create(
                status: "active",
                project: Project.find(3),
                user: User.find_by_email("dev2@test.com")
                )

Engagement.create(
                status: "active",
                project: Project.find(4),
                user: User.find_by_email("dev2@test.com")
                )

Engagement.create(
                status: "active",
                project: Project.find(5),
                user: User.find_by_email("dev2@test.com")
                )

 p "5 engagements created"
