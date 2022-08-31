class CreateComents < ActiveRecord::Migration[6.1]
  def change
    create_table :coments do |t|
      t.belongs_to :problem
      t.belongs_to :user
      t.string :comment
      t.boolean :confirm
      t.timestamps
    end
  end
end
