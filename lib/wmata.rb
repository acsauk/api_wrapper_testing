$:.unshift(File.dirname(__FILE__))
require 'client'
module WMATA
  def self.client
    @client ||= Client.new(api)
  end

  def self.api
    @api || raise("please set the api key")
  end

  def self.api=(api_key)
    @client = Client.new(api_key)
    @api = api_key
  end

  def self.next_trains(station = "A06")
    client.next_trains(station)
  end

  def self.station_info(station = "A06")
    client.station_info(station)
  end
end
