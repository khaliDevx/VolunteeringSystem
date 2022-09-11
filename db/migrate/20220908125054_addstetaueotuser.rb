class Addstetaueotuser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :boolean, :defulet => true
    
  end
end
