require 'addressable/uri'
require 'rest-client'

# users = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s
#
# puts RestClient.get(users)
#
# user_1 = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/1'
# ).to_s
#
# puts RestClient.get(user_1)

# new_user = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users'
# ).to_s
# params = {:user => {:username => 'batman@test.com'}}
# puts RestClient.post(new_user, params)

# update_user = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/1'
# ).to_s
#
# params = {:user => {:username => 'therealzac@test.com'}}
# puts RestClient.put(update_user, params)

delete_user = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3'
).to_s

puts RestClient.delete(delete_user)
