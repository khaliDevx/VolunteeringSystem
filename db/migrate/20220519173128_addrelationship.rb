class Addrelationship < ActiveRecord::Migration[6.1]
  def change
    add_reference :issues, :city_id
    
  end
end
