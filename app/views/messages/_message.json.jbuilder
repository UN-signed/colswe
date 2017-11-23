json.extract! message, :id, :from_id, :to_id, :subject, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
