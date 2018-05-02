json.extract! collab_space_listing, :id, :user_id, :name, :brief_description, :description, :rules, :surrounding_area_description, :overall_rating, :cost_per_day, :address_id, :created_at, :updated_at
json.url collab_space_listing_url(collab_space_listing, format: :json)
