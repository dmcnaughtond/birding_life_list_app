User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# users = User.take(6)
# 50.times do
#   content = Faker::Lorem.sentence(2)
#   users.each { |user| user.sighting_records.create!(order: content, 
#               family: content, genus_species: content, 
#               common_name: content, location: content, date: content,
#               notes: content) }
# end

