FactoryGirl.define do
  factory :trip do
    start { Faker::Address.city }
    stop  { Faker::Address.city }
    start_time { Date.today + rand(20) }
    price      { rand(10) }
    passengers { rand(5) }
    description { Faker::Lorem.characters(50) }
    rating      { rand(5) }
  end

  factory :comment do
    title { Faker::Lorem.word }
    text  { Faker::Lorem.characters(100) }
    association :author, factory: :trip

    factory :invalid_comment do
      title nil
      text nil
      author_id nil
    end
  end

  factory :user do
    name    { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    phone_num { Faker::PhoneNumber.cell_phone }
    email     { Faker::Internet.email }
    password  { "user_pass#{ Faker::Internet.password }" }
    role "driver"
    admin false
  end

  factory :car do
    name { Faker::Lorem.word }
    sits { (rand(9) + 1) }
    association :driver, factory: :user

    factory :invalid_car do
      name nil
      sits nil
      driver_id nil
    end
  end
end
