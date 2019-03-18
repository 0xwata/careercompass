class ChangeDatatypeEndDateOfCareers < ActiveRecord::Migration[5.1]
  def change
       change_column :careers, :end_date, :date
  end
end
