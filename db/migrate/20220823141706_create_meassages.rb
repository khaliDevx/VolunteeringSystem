class CreateMeassages < ActiveRecord::Migration[6.1]
  def up
    create_table :meassages do |t|
      t.belongs_to :user
      t.string :meassage 
      t.datetime :date_time
      t.timestamps
    end
  end
  def down 
    drop_table :meassages
  end
end
