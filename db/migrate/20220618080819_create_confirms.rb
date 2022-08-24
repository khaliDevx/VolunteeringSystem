class CreateConfirms < ActiveRecord::Migration[6.1]
  def up
    create_table :confirms do |t|

      t.timestamps
      t.boolean :confirmed
    end
  end
  def down 
    drop_table :confirms
  end
end
