json.array!(@messages) do |message|
  json.extract! message, :id, :sender_id, :recipient_id, :message, :read, :message_thread_id
  json.url message_url(message, format: :json)
end
