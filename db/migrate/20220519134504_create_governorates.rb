class CreateGovernorates < ActiveRecord::Migration[6.1]
  def up
    create_table :governorates do |t|
      t.string :name
      t.string :zip_cod

      t.timestamps
    end
  end
  def down 
    drop_table :governorates
  end
end
