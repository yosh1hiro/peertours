json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :password_digest, :phone_number, :sex, :birthdate_1, :birthdate_2, :birthdate_3, :description, :remember_token, :photo_url
  json.url user_url(user, format: :json)
end
