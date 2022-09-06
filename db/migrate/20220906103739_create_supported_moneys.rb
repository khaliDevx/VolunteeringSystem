class CreateSupportedMoneys < ActiveRecord::Migration[7.0]
  def up
    create_table :supported_moneys do |t|
      t.belongs_to :user
      t.belongs_to :problem
      t.integer :amount
      t.belongs_to :money_type
      t.timestamps
    end
  end
  def down 
    drop_table :supported_moneys
  end
end
