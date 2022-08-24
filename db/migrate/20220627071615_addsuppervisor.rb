class Addsuppervisor < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :supervisor, :boolean ,:default => false
    #Ex:- :default =>''
  end
end
