require 'addressable/uri'
require 'rest_client'
require 'json'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/2',
  # query_values: { :id => 1 }
).to_s

begin
  a = RestClient.delete(url)
  p a
rescue => e
  p e
end