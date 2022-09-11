class CreateAcceptMoneys < ActiveRecord::Migration[7.0]
  def change
    create_table :accept_moneys do |t|
      t.belongs_to :user
      t.belongs_to :problem
      t.integer :sup_id
      t.integer :amount
      t.timestamps
    end
  end
end
