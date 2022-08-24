class CreateCities < ActiveRecord::Migration[6.1]
  def up
    create_table :cities do |t|
      t.string :name
      t.belongs_to :governorate
      t.timestamps
    end
  end
  def down 
    drop_table :cities
  end
end
