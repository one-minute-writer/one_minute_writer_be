class DashboardMetricsService

  def self.get_writing_metrics(writing_ids) #writing_ids must be a comma dilineated string of id numbers with no spaces.
    response = conn.get("/dashboard?writing_ids=#{writing_ids}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_writing_metrics(writing_id, word_count, total_time) #writing_id. word_count, total_time must be passed in as integers.
    response = conn.post("/dashboard?writing_id=#{writing_id}&word_count=#{word_count}&total_time=#{total_time}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    conn = Faraday.new(url: "https://enigmatic-oasis-75046.herokuapp.com")
  end

end
