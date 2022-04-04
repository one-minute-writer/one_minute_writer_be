class AddMetricsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dashboard_metrics, :hstore, default: {}
  end
end
