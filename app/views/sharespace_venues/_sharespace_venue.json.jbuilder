json.extract! sharespace_venue, :id, :user_id, :name, :brief_description, :description, :rules, :surrounding_area_description, :overall_rating, :cost_per_day, :address_id, :created_at, :updated_at
json.url sharespace_venue_url(sharespace_venue, format: :json)
