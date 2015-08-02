FactoryGirl.define do
  factory :tour_flow do
    association :tour
    flow { Faker::Lorem.sentence }
  end
end
