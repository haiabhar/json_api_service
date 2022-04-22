class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.belongs_to :post, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :post_owner

      t.timestamps
    end
  end
end
