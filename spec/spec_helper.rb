$:.unshift 'lib'
require 'wmata'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # config.before(:each) do
  #   stub_request(:get, %r|https://api.wmata.com/StationPrediction.svc/json/GetPrediction/|).
  #     to_return(status: 200, body: File.open("./spec/fixtures/next_trains.json"){|f| f.read}, headers: {})
  # end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
