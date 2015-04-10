class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :voteable, index: true
      t.integer :value

      t.timestamps null: false
    end
    add_foreign_key :votes, :users
    add_foreign_key :votes, :voteables
  end
end
