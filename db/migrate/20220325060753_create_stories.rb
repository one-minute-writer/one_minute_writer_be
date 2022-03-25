class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.references :user, foreign_key: true
      t.integer :total_time
      t.string :body_text
      t.string :image
      t.string :words, array: true
      t.string :sound

      t.timestamps
    end
  end
end
