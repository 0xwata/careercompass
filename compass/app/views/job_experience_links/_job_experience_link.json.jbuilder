json.extract! job_experience_link, :id, :user_id, :position_from, :position_to, :created_at, :updated_at
json.url job_experience_link_url(job_experience_link, format: :json)
