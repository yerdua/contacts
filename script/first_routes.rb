require 'addressable/uri'
require 'rest_client'
require 'json'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts.json',
  # query_values: { :id => 1 }
).to_s

begin
  a = RestClient.post(url, :contact => {:name => "Belda", :email => "emailaddress@email.com", :address => "100 Market Street, San Francisco, CA", :phone_number => 5555555555})
  p a
rescue => e
  p e
end