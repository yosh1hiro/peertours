FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password 'secret'
    password_confirmation 'secret'

    factory :full_info do
      sex 'male'
      birthdate_1 12
      birthdate_2 30
      birthdate_3 1990
      description Faker::Lorem.paragraph
      photo_url Faker::Avatar.image
    end

    factory :invalid_user do
      first_name nil
    end
  end
end
