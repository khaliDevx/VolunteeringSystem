class Addanddelete < ActiveRecord::Migration[6.1]
  def change
    rename_column :issues, :city_id_id, :city
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
