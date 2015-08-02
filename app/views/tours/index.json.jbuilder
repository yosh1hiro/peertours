json.array!(@tours) do |tour|
  json.extract! tour, :id, :host_id, :name, :outline, :description, :minimum_number, :maximum_number, :rendezvous
  json.url tour_url(tour, format: :json)
end
