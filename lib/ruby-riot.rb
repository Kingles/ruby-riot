require "ruby-riot/version"

require 'rubygems'
require 'bundler/setup'
gem 'minitest' 

require "httparty"
Dir[File.dirname(__FILE__) + '/ruby-riot/*.rb'].each do |file|
  require file
end

#todo: CACHING, LOCAL STORAGE

module RubyRiot
	REGION = 'na'
	VERSION = 'v1.1'
	API_KEY = '064bda43-a64d-4323-b207-cbc92e14883a'
	BASE_URI = "https://developer.riotgames.com/api/lol/#{REGION}/#{VERSION}/"
end
