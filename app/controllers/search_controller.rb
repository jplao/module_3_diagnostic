class SearchController < ApplicationController
  def index
    @station_data = StationFacade.new(params[:q])
  end
end
