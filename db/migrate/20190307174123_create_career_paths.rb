class CreateCareerPaths < ActiveRecord::Migration[5.1]
  def change
    create_table :career_paths do |t|
      t.integer :user_id
      t.integer :from_career
      t.integer :to_career

      t.timestamps
    end
  end
end
