class CreateIssues < ActiveRecord::Migration[6.1]
  def up
    create_table :issues do |t|
      t.binary :image
      t.text :desciption
      t.string :cordinates
      t.string :status, :default => "Submitted"
      t.belongs_to :user 
      t.belongs_to :category
      t.timestamps
    end
  end
  def down 
    drop_table :issues
  end
end
