json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :guest_id, :tour_id, :appointment_date, :status, :guest_number
  json.url reservation_url(reservation, format: :json)
end
