class CreateAcceptMats < ActiveRecord::Migration[7.0]
  def change
    create_table :accept_mats do |t|
      t.belongs_to :user
      t.belongs_to :problem
      t.belongs_to :material
      t.integer :quantity
      t.integer :sup_id
      t.timestamps
    end
  end
end
