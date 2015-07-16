FactoryGirl.define do
  factory :tour_photo do
    association :tour
    url { Faker::Internet.url }
  end
end
