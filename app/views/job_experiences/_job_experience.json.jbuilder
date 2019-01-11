json.extract! job_experience, :id, :job_id, :user_id, :company_id, :start_of_date, :end_of_date, :created_at, :updated_at
json.url job_experience_url(job_experience, format: :json)
