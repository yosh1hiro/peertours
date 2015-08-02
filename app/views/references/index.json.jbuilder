json.array!(@references) do |reference|
  json.extract! reference, :id, :request_id, :body, :relationship
  json.url reference_url(reference, format: :json)
end
