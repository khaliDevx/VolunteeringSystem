class RenamefiledProblemId < ActiveRecord::Migration[6.1]
  def change
    add_reference :bill_of_materials, :accept, foreign_key: true
    remove_column :bill_of_materials, :problem_id
  end
end
