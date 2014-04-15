FactoryGirl.define do

  factory :trip do
    users { [FactoryGirl.create(:user)] }
    start { Faker::Address.city }
    stop  { Faker::Address.city }
    start_time { Date.today + rand(20) }
    price      { rand(10) }
    passengers { rand(9) +1 }
    description { Faker::Lorem.characters(50) }
    rating      { rand(4) }
  end

  factory :comment do
    association :author, factory: :user
    association :trip
    title { Faker::Lorem.words(3).join(' ') }
    text  { Faker::Lorem.characters(100) }

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
    role 'Driver'
    admin false
  end

  factory :car do
    association :driver, factory: :user
    name { Faker::Lorem.word }
    sits { (rand(9) + 1)/1 }

    factory :invalid_car do
      name nil
      sits nil
      driver_id nil
    end
  end
end
