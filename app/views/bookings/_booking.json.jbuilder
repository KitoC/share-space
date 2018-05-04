json.extract! booking, :id, :date_from, :date_to, :total_days, :user_id, :sharespace_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
