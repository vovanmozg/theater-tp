json.extract! event, :id, :title, :date_start, :date_end, :created_at, :updated_at
json.url event_url(event, format: :json)
