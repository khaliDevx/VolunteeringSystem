class Deleteimage < ActiveRecord::Migration[6.1]
  def change
    remove_column :issues, :image
  end
end
