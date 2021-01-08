class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user
    validates :review, presence: true
    validates :title, presence: true
    accepts_nested_attributes_for :book
end
