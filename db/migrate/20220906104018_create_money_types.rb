class CreateMoneyTypes < ActiveRecord::Migration[7.0]
  def up
    create_table :money_types do |t|
      t.string :coins
      t.timestamps
    end
  end
  def down 
    drop_table :money_types
  end
end
