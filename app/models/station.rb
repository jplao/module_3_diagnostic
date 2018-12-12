class Station
  attr_reader :name,
              :address,
              :access_times,
              :distance

  def initialize(data)
    @name = data['station_name']
    @address = data['street_address']
    @distance = data['distance']
    @fuel_types = data['fuel_type_code']
    @access_times = data['access_days_time']
  end

  def fuel_types
    @fuel_types.map do |fuel|
      if 'ELEC'
        'Electric'
      elsif 'E85'
        'Propane'
      end
    end
  end
end
