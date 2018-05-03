json.extract! photo, :id, :image, :caption, :profile, :created_at, :updated_at
json.url photo_url(photo, format: :json)
