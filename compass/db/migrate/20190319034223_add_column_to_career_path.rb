class AddColumnToCareerPath < ActiveRecord::Migration[5.1]
  def change
    add_column :career_paths, :order_id, :integer
  end
end
