class Category < ApplicationRecord
    validates :name, presence: true, confirmation: true, uniqueness: { message: "this category already exists" }
    
    
end
