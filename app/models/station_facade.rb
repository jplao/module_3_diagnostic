class StationFacade

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def get_stations
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json")

    stations_hash = JSON.parse(response.body)['fuel_stations']
    stations_hash.map do |station_hash|
      Station.new(station_hash)
    end
    binding.pry
  end

  private
  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params['api_key'] = ENV['API_KEY']
      faraday.params['location'] = "#{@zip_code}"
      faraday.params['limit'] = '10'
      faraday.params['fuel_type'] = 'E85,ELEC'
      faraday.adapter  Faraday.default_adapter
    end
  end


end
