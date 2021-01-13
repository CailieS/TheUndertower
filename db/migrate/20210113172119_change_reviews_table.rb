class ChangeReviewsTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :review, :comment
  end
end
