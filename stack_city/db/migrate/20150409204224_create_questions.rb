class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :vote_count
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :users
  end
end
