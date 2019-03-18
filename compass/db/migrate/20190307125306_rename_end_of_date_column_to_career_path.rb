class RenameEndOfDateColumnToCareerPath < ActiveRecord::Migration[5.1]
  def change
       rename_column :careers, :end_of_date, :end_date
  end
end
