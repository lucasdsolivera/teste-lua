class CreateBlockedWords < ActiveRecord::Migration
  def change
    create_table :blocked_words do |t|
      t.string :word

      t.timestamps null: false
    end
  end
end
