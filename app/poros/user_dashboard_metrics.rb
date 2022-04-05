class UserDashboardMetrics

  attr_reader :total_words_all_time,
              :total_time,
              :average_words_per_minute

  def initialize(data) # Can add more variables to PORO as python microservice grows
    @total_words_all_time = data[:total_words_all_time]
    @total_time = data[:total_time_all_time]
    @average_words_per_minute = data[:average_words_per_minute]
  end
  
end
