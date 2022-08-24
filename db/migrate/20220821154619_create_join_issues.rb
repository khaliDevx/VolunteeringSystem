class CreateJoinIssues < ActiveRecord::Migration[6.1]
  def up
    create_table :join_issues do |t|
      t.belongs_to :problem
      t.belongs_to :user
      t.timestamps
    end
  end
  def def down 
    drop_table :join_issues
  end
end
