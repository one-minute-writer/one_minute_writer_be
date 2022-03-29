class ChangeStoriesTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :total_time
    add_column :stories, :total_time_in_seconds, :integer
  end
end
