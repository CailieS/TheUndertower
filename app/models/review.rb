class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user
    validates :comment, presence: true
    validates :title, presence: true
    
 

end
