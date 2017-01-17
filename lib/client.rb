require 'httparty'
module WMATA
  class Client
    include HTTParty
    base_uri "https://api.wmata.com"

    def initialize(api_key)
      @options = { query: {api_key: api_key} }
    end

    def next_trains(stations="A06")
      response = self.class.get("/StationPrediction.svc/json/GetPrediction/#{stations}", @options)
      JSON.parse(response.body)["Trains"]
    end

    def station_info(stations="A06")
      response = self.class.get("/Rail.svc/json/jStationInfo#{stations}", @options)
      JSON.parse(response.body)
    end

  end
end
