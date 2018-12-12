class Station
  attr_reader :name,
              :address,
              :fuel_types,
              :access_times,
              :distance

  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @distance = data[:distance]
    @fuel_types = data[:fuel_type_code]
    @access_times = data[:access_days_time]
  end
end
