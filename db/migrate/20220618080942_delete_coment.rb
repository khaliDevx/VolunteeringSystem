class DeleteComent < ActiveRecord::Migration[6.1]
  def change
    remove_column :coments, :confirm
  end
end
