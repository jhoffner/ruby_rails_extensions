class Time
  class << self

    def time_s(time, format = nil)
      unless format
        format = "%M:%S"
        format = "%H:" + format if time >= 60 * 60
      end
      Time.at(time).utc.strftime(format)
    end
  end
end