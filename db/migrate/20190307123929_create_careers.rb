class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.integer :user_id
      t.integer :company_id
      t.integer :job_id
      t.text :experience
      t.datetime :start_of_date
      t.datetime :end_of_date

      t.timestamps
    end
  end
end
