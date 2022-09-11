class Addstasuanddelet < ActiveRecord::Migration[7.0]
  def change
    remove_column :join_issues, :Status
    add_column :join_issues, :status, :boolean, :defulet => false
  end
end
