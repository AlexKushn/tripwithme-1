FactoryGirl.define do
  factory :trip do
    start { Faker::Address.city }
    stop  { Faker::Address.city }

    start_time { Date.today + rand(20) }
    price { rand(10) }
    passengers { rand(5) }
    description { Faker::Lorem.paragraph }
  end

  factory :comment do
    sequence(:title) { |n| "Title_ #{n}" }
    text { Faker::Lorem.paragraph }
    trip
  end
end
