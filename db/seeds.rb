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
ActiveRecord::Base.connection.reset_pk_sequence!(:messages)
ActiveRecord::Base.connection.reset_pk_sequence!(:conversations)


#Default Dummy Organization for Admin users
# # ID 1
# admin_org = Organization.create!(
#                     name: "All Together",
#                     mission: "Community Fellowship",
#                     logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176760/clothes_closet_w4buuo.webp",
#                     latitude: 50.4585102,
#                     longitude: -104.7754917  
# )
#Default Dummy Organization for Dev users
# ID 2
dev_org = Organization.create!(
                    name: "Farm to Table Together",
                    mission: "Farmers' co-op",
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176760/clothes_closet_w4buuo.webp",
                    latitude: 54.1777568,
                    longitude: -104.4379119  
                  )

# Organizations for users associated with an organization
# ID 3
clothes_closet = Organization.create!(
                    name: 'Montreal Clothes Closet',
                    mission: 'To help everyone dress for success',
                    address: "5505 St Laurent Blvd, Montreal",
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176760/clothes_closet_w4buuo.webp",
                    latitude: 45.5259952,
                    longitude: -73.5998071  
                  )
# ID 4
food_pantry = Organization.create!(
                    name: 'The Winnipeg Food Pantry',
                    mission: 'Food is a human right!',
                    address: '561 Bannerman Ave, Winnipeg',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176750/Food_Pantry_xqoodw.jpg",
                    latitude: 49.9297444,
                    longitude: -97.1421969
                )
msf = Organization.create!(
                    name: 'Doctors Without Borders',
                    mission: 'Medical Aid Where It Is Needed Most. Independent. Neutral. Impartial.',
                    address: '551 Adelaide Street West Toronto, Ontario',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609246/doctors_without_borders_la3ij2.jpg",
                    latitude: 43.6451346,
                    longitude: -79.4050997  
                )
acumen = Organization.create!(
                    name: 'ACUMEN',
                    mission: 'Changing the way the world tackles poverty',
                    address: '40 Worth Street, New York, NY, 10013',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609245/acumen_qlizvu.png",
                    latitude: 40.7172991,
                    longitude: -74.0091831
                )
org5 = Organization.create!(
                    name: 'Heifer International',
                    mission: 'What if they had not a cup of milk, but a cow?',
                    address: '1 World Avenue, Little Rock, AR 72202',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609246/Heifer_Logo_pwtr08.png",
                    latitude: 34.7448171,
                    longitude: -92.2584105
                )
ashoka = Organization.create!(
                    name: 'Ashoka',
                    mission: 'Everyone a Changemaker',
                    address: '1700 North Moore Street, Arlington, VA 22209',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609246/AShoka_logo_mza8y6.png",
                    latitude: 46.9748031,
                    longitude: -72.2101118 
                )
cure = Organization.create!(
                    name: 'Cure Violence Global',
                    mission: "Let's Make the Cure Contagious!",
                    address: '1329 N. Dearborn Street, Chicago, IL 60612',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609246/cure_violence_global-250x354_ahaxi1.png",
                    latitude: 41.9066849,
                    longitude: -87.6319148 
                )
brac = Organization.create!(
                    name: 'BRAC',
                    mission: 'Creating opportunities for everyone to realize their potential',
                    address: 'Vancouver, BC',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609246/BRAC_logo4.svg_-250x83_rnfqes.png",
                    latitude: 49.2578262,
                    longitude: -123.1941154 
                )
wikimedia = Organization.create!(
                    name: 'WIKIMEDIA FOUNDATION',
                    mission: 'Helping everyone share in the sum of all knowledge',
                    address: '149 New Montgomery Street, San Francisco, CA 94105',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609246/WIKIMEDIA-FOUNDATION_Logo_li9i7k.png",
                    latitude: 37.7869487,
                    longitude: -122.4017916  
                )
oxfam = Organization.create!(
                    name: 'Oxfam',
                    mission: 'The power of people against poverty',
                    address: '39 McArthur Avenue, Ottawa, ON',
                    logo: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567609246/oxfam_u8dmno.png",
                    latitude: 45.4312297,
                    longitude: -75.6689933 
                )
p "10 organizations created"

# # Users - Admin
# new_admin = User.create!(
#                         email: "admin@test.com",
#                         organization: admin_org,
#                         username: "admin",
#                         password: "password",
#                         first_name: "Admin",
#                         last_name: "Test",
#                         group: "admin",
#                         admin: true,
#                         developer: false
#                       )
# p "1 admin user created"

# Users - NGO Montreal Clothes Closet
clothes_closet_rep = User.create!(
                      email: "caitlin@clothescloset.org",
                      username: "ngo",
                      password: "password",
                      first_name: "Caitlin",
                      last_name: "Snyder",
                      admin: false,
                      organization: clothes_closet,
                      developer: false,
                      group: "ngo",
                      remote_photo_url: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1567176925/Screen_Shot_2019-08-30_at_10.55.07_AM_obcjks.png",
                      interests: "Making rhubarb preserves with my neighbors.",
                      bio: "Founder of local NGO supporting career-aspiring individuals from low-income communities.",
                      experience: "Working with NGOs for the last 8 years.",
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
              email: "sam@newdev.com",
              username: "dev",
              password: "password",
              first_name: "Sam",
              last_name: "M.-Morin",
              admin: false,
              organization: dev_org,
              developer: true,
              group: "developer",
              remote_photo_url: "https://res.cloudinary.com/caitlinsnyder/image/upload/v1566505936/luz9wt7bg6qqzktauf55.jpg",
              interests: "Skateboarding while reviewing my Ruby flashcards. Who says you can't combine passions?",
              bio: "Batch #281 of Le Wagon Coding Bootcamp!",
              experience: "I built a solid foundation of Ruby on Rails in my Le Wagon bootcamp--now I'm hoping to build my skills with an NGO!",
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
              description: "Real-time app to track inventory",
              title: "Food-friendly mobile app",
              user: food_pantry_rep,
              active: true,
              category: "Mobile app"
            )
Project.create(
              organization: clothes_closet, # Montreal Clothes Closet
              description: "Help us track our clothing rentals and availability!",
              title: "Clothing database",
              user: clothes_closet_rep,
              active: true,
              category: "Database"
            )

Project.create(
              organization: wikimedia,
              description: "Looking for someone to help us improve our site's UX",
              title: "UX designer wanted!",
              user: food_pantry_rep,
              active: true,
              category: "UX"
            )

Project.create(
              organization: ashoka,
              description: "Website for partner organization",
              title: "Calling all snazzy web developers",
              user: food_pantry_rep,
              active: true,
              category: "Website"
            )

Project.create(
              organization: msf,
              description: "Seeking online graph for existing dataset",
              title: "Do you like data?",
              user: food_pantry_rep,
              active: true,
              category: "Data visualization"
            )

Project.create(
              organization: acumen,
              description: "Hoping that someone out there can automate our manual data download processes.",
              title: "Can you scrape data faster than us?",
              user: food_pantry_rep,
              active: true,
              category: "Data analysis"
            )
p "4 projects created"


# #Create engagements
# Engagement.create(
#                 status: "Rejected",
#                 project: Project.find(2),
#                 user: User.find_by_email("sam@newdev.com"),
#                 )

# Engagement.create(
#                 status: "Rejected",
#                 project: Project.find(3),
#                 user: User.find_by_email("sam@newdev.com")
#                 )

# Engagement.create(
#                 status: "Active",
#                 project: Project.find(3),
#                 user: User.find_by_email("sam@newdev.com")
#                 )

# Engagement.create(
#                 status: "Pending",
#                 project: Project.find(5),
#                 user: User.find_by_email("sam@newdev.com")
#                 )

# Engagement.create(
#                 status: "Active",
#                 project: Project.find(3),
#                 user: User.find_by_email("sam@newdev.com")
#                 )

# Engagement.create(
#                 status: "Archived",
#                 project: Project.find(4),
#                 user: User.find_by_email("sam@newdev.com")
#                 )

# Engagement.create(
#                 status: "Rejected",
#                 project: Project.find(5),
#                 user: User.find_by_email("sam@newdev.com")
#                 )


 # p "2 engagements created"
