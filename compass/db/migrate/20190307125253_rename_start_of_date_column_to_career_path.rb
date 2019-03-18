class RenameStartOfDateColumnToCareerPath < ActiveRecord::Migration[5.1]
  def change
        rename_column :careers, :start_of_date, :start_date
  end
end
