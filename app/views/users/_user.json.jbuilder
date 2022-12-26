json.extract! user, :id, :username, :email, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
