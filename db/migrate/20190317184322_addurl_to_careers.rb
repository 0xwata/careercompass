class AddurlToCareers < ActiveRecord::Migration[5.1]
  def change
    add_column :careers, :url, :text
  end
end
