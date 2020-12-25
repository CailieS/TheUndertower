class User < ApplicationRecord
    has_many :books, through: :reviews
    has _many :reviews
end
