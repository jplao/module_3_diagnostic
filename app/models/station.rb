class Station
  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @fuel_types = data[:fuel_type_code]
    @distance =
    @access_times = data[:access_dats_time]
  end
end
