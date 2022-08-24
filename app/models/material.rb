class Material < ApplicationRecord
    validates :name, presence: true
    validates :category_id, presence: true
    
    
    
    
end
