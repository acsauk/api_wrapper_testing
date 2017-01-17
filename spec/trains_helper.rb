def stub_api_call(api_url, json_file_name)
  stub_request(:get, %r|https://api.wmata.com/#{api_url}|).
    to_return(status: 200, body: File.open("./spec/fixtures/#{json_file_name}.json"){|f| f.read}, headers: {})
end
