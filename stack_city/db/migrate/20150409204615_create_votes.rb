class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :voteable, polymorphic: true, index: true
      t.integer :value

      t.timestamps null: false
    end
    add_foreign_key :votes, :users
  end
end
