require "base64"
require "json"

primary_route = 'localhost:3000'

if ENV.has_key? 'PLATFORM_ROUTES'
  routes = JSON.parse Base64.decode64(ENV['PLATFORM_ROUTES'])
  routes.each do |route|
    primary_route = route[0] if route[1]['type'] == 'upstream'
  end
end

Rails.configuration.x.platformsh = {
    :primary_route => primary_route
}