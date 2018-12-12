class SearchController < ApplicationController
  def index
    @station_data = StationFacade.new
  end
end
