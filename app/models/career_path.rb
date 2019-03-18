class CareerPath < ApplicationRecord

  def self.execute_search(from_id, to_id)
    if from_id.present? and to_id.present?
      sql = self.search_paths_from_to(from_id, to_id)
    elsif from_id.present? and to_id.nil?
      sql = self.search_paths_from(from_id)
    else from_id.nil? and to_id.present?
      sql = self.search_paths_to(to_id)
    end
    ActiveRecord::Base.connection.select_all(sql).to_hash

  end 
  def self.search_paths_from(from_id)
    "
    Select cp.user_id, c_from.name as from_career, c_to.name as to_career
    From career_paths cp
    inner join companies c_from on c_from.id = cp.from_career
    inner join companies c_to on c_to.id = cp.to_career
    Where cp.user_id in 
    (
      Select distinct(cp_from.user_id)
      From career_paths cp_from
      where cp_from.from_career = #{from_id}
    )
    "
  end

  def self.search_paths_to(to_id)
    "
    Select cp.user_id as user_id, c_from.name as from_career, c_to.name as to_career
    From career_paths cp
    inner join companies c_from on c_from.id = cp.from_career
    inner join companies c_to on c_to.id = cp.to_career
    Where cp.user_id in 
    (
      Select distinct(cp_to.user_id)
      From career_paths cp_to
      Where cp_to.to_career = #{to_id}
    )
    "
  end

  def self.search_paths_from_to(from_id, to_id)
    "
    Select cp.user_id, c_from.name as from_career, c_to.name as to_career
    From career_paths cp
    inner join companies c_from on c_from.id = cp.from_career
    inner join companies c_to on c_to.id = cp.to_career
    Where cp.user_id in 
    (
      Select distinct(cp_to.user_id)
      From career_paths cp_to
      Where cp_to.to_career = #{to_id}
      and cp_to.user_id in
        (
        Select distinct(cp_from.user_id)
        From career_paths cp_from
        where cp_from.from_career = #{from_id}
        )
    )
    "
  end
end
