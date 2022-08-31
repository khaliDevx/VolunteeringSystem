class Issue < ApplicationRecord
    has_one_attached :image
    belongs_to :city
    
end
