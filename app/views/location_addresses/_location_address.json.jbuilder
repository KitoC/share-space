json.extract! location_address, :id, :city_suburb, :state, :country, :postcode, :created_at, :updated_at
json.url location_address_url(location_address, format: :json)
