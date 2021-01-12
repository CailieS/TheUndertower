class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user
    validates :review, presence: true
    validates :title, presence: true
    validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
    accepts_nested_attributes_for :book
    scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}
end
