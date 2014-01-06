#require "ruby-riot/version"

require 'rubygems'
require 'bundler/setup'
require 'daybreak'
require 'date'
require 'time'
require 'yaml'
gem 'minitest' 
require "httparty"


module RubyRiot
	attr_accessor :region, :api_key, :base_uri, :db, :refresh_date, :long_refresh_date
	@db = ::Daybreak::DB.new "../db/ruby-riot.db"

	def config(opts={})
		config = YAML.load('../config/API.yml')['config']
		@region ||= config['region'] || opts[:region] || 'na'
		@api_key ||= config['api_key'] || opts[:region] 
		@base_uri ||= opts[:base_uri] || "http://prod.api.pvp.net/api/lol/#{REGION}/" #not ssl for now..
		@refresh_date ||= (Date.today - 7).to_time
		@long_refresh_date ||= (Date.today - 30).to_time
	end
	config
	
end

require File.dirname(__FILE__) + '/ruby-riot/apimodel.rb'
Dir[File.dirname(__FILE__) + '/ruby-riot/*.rb'].each do |file|
  require file
end

#todo: CACHING, LOCAL STORAGE

