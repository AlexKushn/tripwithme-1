namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    10.times do |n|
      name = Faker::Name.name
      surname = Faker::Name.name
      phone_num = Faker::Number.number(8)
      email = "example-#{ n+1 }@railstutorial.org"
      password = "password"
      role = "driver"
      User.create!(name: name,
                   surname: surname,
                   phone_num: phone_num,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   role: role)
    end
    users = User.all
    10.times do |d|
      model_name = Faker::Name:name
      model_sits = rand(9) + 1
      users.each { |user| user.cars.create!(name: model_name, sits: model_sits) }
    end
  end
end


