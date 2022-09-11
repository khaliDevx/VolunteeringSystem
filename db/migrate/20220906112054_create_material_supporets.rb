class CreateMaterialSupporets < ActiveRecord::Migration[7.0]
  def change
    create_table :material_supporets do |t|
      t.belongs_to :user
      t.belongs_to :problem
      t.string :quantity
      t.belongs_to :material

      t.timestamps
    end
  end
end
