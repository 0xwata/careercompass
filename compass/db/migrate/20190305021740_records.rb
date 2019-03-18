class Records < ActiveRecord::Migration[5.1]
  def change
    drop_table :job_experience_links
  end
end
