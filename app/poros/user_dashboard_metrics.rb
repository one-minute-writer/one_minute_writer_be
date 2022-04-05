class UserDashboardMetrics

  attr_reader :total_words_all_time,
              :total_time,
              :average_words_per_minute

  def initialize(data) # Can add more variables to PORO as python microservice grows
    @total_words_all_time = data[:total_words_all_time]
    @total_time = data[:total_time_all_time]
    @average_words_per_minute = data[:average_words_per_minute]
  end

  def hours_minutes_and_seconds
    hours = @total_time / (60*60) # number of seconds in a minute x number of minutes in an hour, 3600 seconds.
    minutes = (@total_time / 60) % 60 # the modulo operator (%) gives the remainder when leftside is divided by rightside. Ex: 121 % 60 = 1
    seconds = @total_time % 60
    [hours, minutes, seconds].map do |t|
      # Right justify and pad with 0 until length is 2.
      # So if the duration of any of the time components is 0, then it will display as 00
      t.round.to_s.rjust(2,'0')
    end.join(':')
  end
end
