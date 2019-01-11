class CreateJobExperienceLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :job_experience_links do |t|
      t.integer :user_id
      t.integer :position_from
      t.integer :position_to

      t.timestamps
    end
  end
end
