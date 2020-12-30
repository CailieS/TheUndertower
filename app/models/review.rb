class Review < ApplicationRecord
    belong_to :book
    belong_to :user
    validates :review, presence: true
end
