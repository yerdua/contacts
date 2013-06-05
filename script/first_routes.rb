require 'addressable/uri'
require 'rest_client'
require 'json'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'users/1/contacts/1.json',
  query_values: { :token => "-SY-7VMOD1uKwSZV5H7_pQ" }
).to_s

begin
  a = RestClient.put(url, :contact => {:email => "somethingelse@email"})
  p a
rescue => e
  p e
end