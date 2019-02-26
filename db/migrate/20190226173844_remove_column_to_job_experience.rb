class RemoveColumnToJobExperience < ActiveRecord::Migration[5.1]
  def change
    remove_column :job_experiences, :VARCHAR, :string
  end
end
