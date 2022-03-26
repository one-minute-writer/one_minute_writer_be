class ChangeStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :words
    add_column :stories, :word, :string
  end
end
