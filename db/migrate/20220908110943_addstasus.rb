class Addstasus < ActiveRecord::Migration[7.0]
  def change
    add_column :join_issues, :Status, :boolean ,:defulet=>false
  end
end
