class Time
  def self.time_s(time, format = nil)
    unless format
      format = "%M:%S"
      format = "%H:" + format if time >= 60 * 60
    end
    (time.is_a?(Time) ? time : Time.at(time)).utc.strftime(format)
  end
end