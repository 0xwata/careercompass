class Aaa < ActiveRecord::Migration[5.1]
  def change
    drop_table :job_experiences
  end
end
