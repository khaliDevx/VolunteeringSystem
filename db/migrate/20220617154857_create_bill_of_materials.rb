class CreateBillOfMaterials < ActiveRecord::Migration[6.1]
  def up
    create_table :bill_of_materials do |t|
      t.belongs_to :material
      t.belongs_to :problem
      t.integer  :cost
      t.integer :quantity
      t.belongs_to :unit_of_measure
      t.timestamps
    end
  end
  def down 
    drop_table :bill_of_materials
  end
end
