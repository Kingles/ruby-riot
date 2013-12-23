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
	API_KEY = 'YOUR API KEY'
	BASE_URI = "http://prod.api.pvp.net/api/lol/#{REGION}/" #not ssl for now..
	DB = ::Daybreak::DB.new "../db/ruby-riot.db"
	REFRESH_DATE = (Date.today - 7).to_time
end

require File.dirname(__FILE__) + '/ruby-riot/apimodel.rb'
Dir[File.dirname(__FILE__) + '/ruby-riot/*.rb'].each do |file|
  require file
end

#todo: CACHING, LOCAL STORAGE

