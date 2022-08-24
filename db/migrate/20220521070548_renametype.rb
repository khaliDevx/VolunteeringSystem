class Renametype < ActiveRecord::Migration[6.1]
  def change
    rename_column(:users, :type, :user_type) 
    #Ex:- :default =>''
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
