class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user, index: true
      t.belongs_to :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
  end
end
