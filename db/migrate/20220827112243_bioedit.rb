class Bioedit < ActiveRecord::Migration[6.1]
  def change
    
    remove_column :users, :bio
    add_column :users, :bio, :string
  end
end
