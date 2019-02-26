class CreateJobExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :job_experiences do |t|
      t.integer :job_id
      t.integer :user_id
      t.integer :company_id
      t.date :start_of_date
      t.date :end_of_date

      t.timestamps
    end
  end
end
