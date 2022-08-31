class City < ApplicationRecord
    belongs_to :governorate
    validates :name, presence: true
    validates :governorate_id, presence: true
    
    
    
    
end
