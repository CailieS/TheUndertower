class Book < ApplicationRecord
    has_many :user, through: :review
    has_many :review
    validates :title, presence: true, uniqueness: true
    validates :author, presence: true
    accepts_nested_attributes_for :review, :user
end
