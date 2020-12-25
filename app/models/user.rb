class User < ApplicationRecord
    has_many :book, through: :review
    has_many :review
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
end
