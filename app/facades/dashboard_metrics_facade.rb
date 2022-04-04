class DashboardMetricsFacade

  def self.get_writing_metrics(writing_ids)
    data = DashboardMetricsService.get_writing_metrics(writing_ids)
    UserDashboardMetrics.new(data)
  end

end
