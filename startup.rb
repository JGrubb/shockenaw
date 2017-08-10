#!/usr/bin/env ruby

require "base64"
require "json"

psh_rels = JSON.parse(Base64.decode64(ENV['PLATFORM_RELATIONSHIPS']))

db = psh_rels['database'].first

db.each do |k, v|
  ENV["DB_#{k.upcase}"] = v if v.is_a? String
end