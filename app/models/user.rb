class User < ApplicationRecord
    has_many :books, through: :reviews
    has_many :reviews
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    #validates :password, presence: true, uniqueness: true
end
