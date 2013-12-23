#require "ruby-riot/version"

require 'rubygems'
require 'bundler/setup'
require 'daybreak'
require 'date'
require 'time'
gem 'minitest' 
require "httparty"


module RubyRiot
	REGION = 'na'
	API_KEY = '064bda43-a64d-4323-b207-cbc92e14883a'
	BASE_URI = "http://prod.api.pvp.net/api/lol/#{REGION}/" #not ssl for now..
	DB = ::Daybreak::DB.new "../db/ruby-riot.db"
	REFRESH_DATE = (Date.today - 7).to_time
end

Dir[File.dirname(__FILE__) + '/ruby-riot/*.rb'].each do |file|
  require file
end

#todo: CACHING, LOCAL STORAGE

