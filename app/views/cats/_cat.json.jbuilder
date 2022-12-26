json.extract! cat, :id, :alias, :photo, :description, :latitude, :longitude, :user_id, :created_at, :updated_at
json.url cat_url(cat, format: :json)
json.photo url_for(cat.photo)
