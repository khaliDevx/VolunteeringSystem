class CreateUnitOfMeasures < ActiveRecord::Migration[6.1]
  def up
    create_table :unit_of_measures do |t|
      t.string :name
      t.timestamps
    end
  end
  def down 
    drop_table :unit_of_measures
  end
end
