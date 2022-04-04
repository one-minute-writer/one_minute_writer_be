class EditStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :image
    remove_column :stories, :sound
    add_column :stories, :image, :hstore, default: {}, null: false
    add_column :stories, :sound, :hstore, default: {}, null: false
  end
end
