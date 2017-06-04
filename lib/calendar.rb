require 'google/apis/calendar_v3'

class Calendar

  def initialize
    @calendar = Google::Apis::CalendarV3::Calendar.new
    binding.pry
  end

  def do_stuff
    test = @calendar.description
    binding.pry
  end
end
