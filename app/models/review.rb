class Review < ApplicationRecord
    belong_to :book
    belong_to :user
    validates :content, presence: true
end
