class CreateAccepts < ActiveRecord::Migration[6.1]
  def change
    create_table :accepts do |t|
      t.belongs_to :problem
      t.belongs_to :user
      t.integer :required_volunteer
      t.integer :totale_cost
      t.datetime :start_date
      t.timestamps
    end
  end
end
