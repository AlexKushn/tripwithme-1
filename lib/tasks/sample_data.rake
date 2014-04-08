namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    40.times do |n|
      name = Faker::Name.name
      surname = Faker::Name.name
      phone_num = Faker::Number.number(8)
      email = "example-#{ n+1 }@railstutorial.org"
      password = "password"
      role = "passenger"
      User.create!(name: name,
                   surname: surname,
                   phone_num: phone_num,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   role: role)
    end
  end
end

