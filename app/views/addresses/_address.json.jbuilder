json.extract! address, :id, :street_num, :unit_num, :street_name, :street_type, :address_type, :address_identifier, :city_suburb, :state, :postcode, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
