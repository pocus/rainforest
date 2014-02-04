class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.belongs_to :product
      t.belongs_to :user

      t.timestamps
    end
  end
end
