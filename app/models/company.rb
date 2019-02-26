class Company < ApplicationRecord
  has_many :job_experiences
  has_many :job_experience_links


  def self.search_id_from_company_name(company_name)
	  return Company.find(1) unless company_name
   Company.where(['name LIKE ?', "#{company_name}"]).select("id").first
  end

end
