class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.integer :total_time
      t.string :body_text
      t.string :image
      t.string :words, array: true
      t.string :sound

      t.timestamps
    end
  end
end
