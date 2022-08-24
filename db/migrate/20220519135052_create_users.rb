class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :type
      t.boolean :accountstatu, :default => true 
      t.string :phone
      t.string :username
      t.string :password_digest
      t.belongs_to :city 
      t.timestamps
    end
  end
  def down 
    drop_table :users
  end
end
