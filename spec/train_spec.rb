require 'spec_helper'
require 'trains_helper'
require 'pry'

describe WMATA do
  before(:all) { WMATA.api = 'xxxxx' }

  it 'should predict next trains' do
    stub_api_call('StationPrediction.svc/json/GetPrediction/', 'next_trains')
    expect(WMATA).to respond_to :next_trains
    next_trains = WMATA.next_trains
    expect(next_trains).not_to be_empty
    ["Car","Min","DestinationName"].each{ |field|
      expect(next_trains.first[field]).not_to be_nil }
  end

  it 'should provide station information' do
    stub_api_call('Rail.svc/json/jStationInfo','station_info')
    expect(WMATA).to respond_to :station_info
    station_info = WMATA.station_info
    expect(station_info).not_to be_empty
    ["Address","Code","Name"].each{ |field|
      expect(station_info[field]).not_to be_nil }
  end
end
