class Book < ApplicationRecord
    has_many :users, through: :reviews
    has_many :reviews
    validates :title, presence: true, uniqueness: true
    validates :author, presence: true
    validates :image_url, presence: true
    accepts_nested_attributes_for :reviews
end
