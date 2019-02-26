class JobExperienceLink < ApplicationRecord
   belongs_to :user
   belongs_to :company


   def self.search_from(search)
      return JobExperienceLink.all unless search
      JobExperienceLink.where(['position_from LIKE ?', "#{search}"])
   end

   def self.search_to(search)
      return JobExperienceLink.all unless search
      JobExperienceLink.where(['position_to LIKE ?', "#{search}"])
   end
end
