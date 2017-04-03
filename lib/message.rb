class Message
  attr_reader :messages

  def initialize(message_hash)
    @messages = message_hash
  end

  def get
    msg_cat = @messages[get_time_of_day.to_s] + @messages['generic']
    return msg_cat.sample
  end

  def get_time_of_day
    current_time = DateTime.now
    if current_time.hour >= 5 and current_time.hour < 12
      return :morning
    elsif current_time.hour >= 12 and (current_time.hour <= 5 or (current_time.hour == 6 and current_time.minute <= 30))
      return :afternoon
    elsif (current_time.hour == 17 and current_time.hour > 30) or current_time.hour >= 18 or current_time.hour < 3 or (current_time.hour == 3 and current_time.minute == 0)
      return :evening
    else
      return :generic
    end
  end
end
