namespace :db do
  desc "Fill database with sample data"
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin",
                         email: "admin@sbbooks.org",
                         password: "sbbooks123",
                         password_confirmation: "sbbooks123",
                         admin: true)
=begin
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      title = Faker::Lorem.sentence(2)
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content, title: title) }
    end
=end   
  end
end
 
