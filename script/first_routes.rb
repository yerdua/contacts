require 'addressable/uri'
require 'rest_client'
require 'json'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: 'users/1/contacts/search.json',
  query_values: { :token => "-SY-7VMOD1uKwSZV5H7_pQ", :search_type => :email, :value => '@' }
).to_s

begin
  a = RestClient.get(url)#, :favorite => {:contact_id => 2})
  p a
rescue => e
  p e
end