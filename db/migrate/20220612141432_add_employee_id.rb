class AddEmployeeId < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :employee_id, 
  end
end
