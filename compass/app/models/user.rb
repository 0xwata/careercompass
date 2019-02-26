class User < ApplicationRecord
  has_many :job_experiences
  has_many :job_experience_links
end
