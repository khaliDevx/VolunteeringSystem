class Problem < ApplicationRecord
    has_one_attached :image

    scope :issue_submitted, -> { where(:status => "Submitted")}
    scope :issue_passed, -> { where(:status => "Passed")}
    scope :issue_confirmed, -> { where(:status => "confirmed")}
    scope :accept_issue, -> { where(:status => "Accepted")}
    # Ex:- scope :active, -> {where(:active => true)}
    # scope :desc,  order("problems.id DESC")
    # Ex:- scope :active, -> {where(:active => true)}
    validates :image, presence: true
    
    def self.search(search)
        if search
            # where([["status LIKE ?","%#{search}%"]])
            where(["status LIKE ?","%#{search}%"])
        else
            issue_passed
        end
    end

    # Ex:- scope :active, -> {where(:active => true)}
end
