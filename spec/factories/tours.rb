FactoryGirl.define do
  factory :tour do
    association :host, factory: :User
    name 'Traditional Asakusa in Beautiful Kimono'
    outline 'Wear the kimono (traditional Japanese costume) and feel transformed into the world of Japanese arts and culture'
    description 'Take a walk around Asakusa area and visit traditional temples. If time permits, walk over to Sumikawa River and look at the Skytree, landmark of Tokyo'
    minimum_number 1
    maximum_number 5
    rendezvous 'Asakusa station'

    before(:create) { user = create(:user) } 

    after(:build) do |tour|
      tour.tour_flows << build(:tour_flow, tour: tour)
    end

    after(:build) do |tour|
      tour.tour_categories << build(:tour_category, tour: tour)
    end

    after(:build) do |tour|
      tour.tour_photos << build(:tour_photo, tour: tour)
    end

    after(:build) do |tour|
      tour.tour_prices << build(:tour_price, tour: tour)
    end

    after(:build) do |tour|
      tour.tour_rules << build(:tour_rule, tour: tour)
    end

    factory :invalid_tour do
      name nil
    end
  end
end
