json.extract! user, :id, :name, :birth_of_date, :sex, :mail_address, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
