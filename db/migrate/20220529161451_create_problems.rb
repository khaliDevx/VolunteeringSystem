class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
     
      t.text :desciption
      t.string :status, :default => "Submitted"
      t.belongs_to :user 
      t.belongs_to :category
      t.belongs_to :city
      
      t.timestamps
    end
  end
end
