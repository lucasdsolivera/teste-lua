class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
      t.integer :created_by_comment_id

      t.timestamps null: false
    end
  end
end
