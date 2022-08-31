class User < ApplicationRecord
    has_one_attached :image
    has_secure_password
    scope :volunteer, -> { where(:user_type => "Volunteer")}
    # Ex:- scope :active, -> {where(:active => true)}
    validates :username, confirmation: true, uniqueness: { message: "Username already exists" }
    validates :first_name, presence: true, length: {maximum: 50}
    validates :last_name, presence: true, length: {maximum: 50}
    validates :phone, presence: true, length: {maximum: 9}
    validates :city_id, presence: true
    
    

end
