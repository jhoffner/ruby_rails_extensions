class Time
  def to_clock_format
    utc.strftime("%H:%M:%S")
  end
end