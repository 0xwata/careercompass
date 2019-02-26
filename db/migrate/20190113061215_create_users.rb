class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth_of_date
      t.string :sex
      t.string :mail_address
      t.string :password

      t.timestamps
    end
  end
end
