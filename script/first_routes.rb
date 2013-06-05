require 'addressable/uri'
require 'rest_client'
require 'json'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3/contacts.json',
  query_values: { :token => "sNCx09brDzJKGCRcWw_7dg" }
).to_s

begin
  a = RestClient.get(url)
  p a
rescue => e
  p e
end