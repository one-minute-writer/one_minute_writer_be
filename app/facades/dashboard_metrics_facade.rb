class DashboardMetricsFacade

  def self.get_writing_metrics(writing_ids)
    data = DashboardMetricsService.get_writing_metrics(writing_ids)
    UserDashboardMetrics.new(data)
  end

  def self.post_writing_metrics(writing_id, word_count, total_time)
    metrics = DashboardMetricsService.post_writing_metrics(writing_id, word_count, total_time)

    MetricPost.new(metrics)
  end

end
