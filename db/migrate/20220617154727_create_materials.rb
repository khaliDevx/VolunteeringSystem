class CreateMaterials < ActiveRecord::Migration[6.1]
  def up
    create_table :materials do |t|
      t.string :name 
      t.belongs_to :category
      t.timestamps
    end
  end
  def down 
    drop_table :materials
  end
end
