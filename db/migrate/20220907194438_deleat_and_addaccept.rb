class DeleatAndAddaccept < ActiveRecord::Migration[7.0]
  def change
    remove_column :bill_of_materials, :totale_cost
    add_column :accepts, :totale_cost, :integer
  end
end
