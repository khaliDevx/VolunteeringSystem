class Renamecity < ActiveRecord::Migration[6.1]
  def change
    rename_column :issues, :city, :city_id
  end
end
