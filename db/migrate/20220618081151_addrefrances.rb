class Addrefrances < ActiveRecord::Migration[6.1]
  def change
    add_reference :confirms, :problem, foreign_key: true
    add_reference :confirms, :user, foreign_key: true
  end
end
