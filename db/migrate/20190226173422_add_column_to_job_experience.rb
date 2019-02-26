class AddColumnToJobExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :job_experiences, :experience, :string
    add_column :job_experiences, :VARCHAR, :string
  end
end
