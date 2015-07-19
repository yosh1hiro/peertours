json.array!(@reviews) do |review|
  json.extract! review, :id, :trip_id, :user_id, :tour_id, :body, :rating
  json.url review_url(review, format: :json)
end
