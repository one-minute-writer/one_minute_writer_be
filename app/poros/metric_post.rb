class MetricPost
  attr_reader :writing_id,
              :word_count,
              :time_spent,
              :date_created

  def initialize(data)
    @writing_id = data[:writing_id]
    @word_count = data[:word_count]
    @time_spent = data[:time_spent]
    @date_created = data[:created_at]
  end

end
