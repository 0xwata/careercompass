class AddColumnCareerPaths < ActiveRecord::Migration[5.1]
  def change
  end

  def up
    add_column :career_paths, :user_id, :integer
  end

end
