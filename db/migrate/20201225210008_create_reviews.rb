class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.text :title
      t.text :review
      t.timestamps
    end
  end
end
