require 'debugger'

module RubyRiot
	class Summoner < APIModel
		attr_reader :id, :name, :level
		VERSION = "v1.1"
		ID = 'summoner'
		set_base_uri VERSION, ID

		def initialize(id)
			@res = get_id id
			@name = @res["summonerName"]
			@id = @res["id"]
			@level = @res["summonerLevel"]
			DB.set! @id, @res
		end

		def get_from_db(id)
			
		end

		def get_id(id)
			if id.class == String
				DB.select{|key,val| val["summonerName"] == id && ((val['summonerLevel'] == 30 || Time.at(val['revisionDate']/1000) < REFRESH_DATE))  }.first || self.class.by_name(id).to_hash
			elsif id.class == Fixnum || id.to_i != 0 
				DB.select{|key,val| val["id"] == id}.first || self.class.by_id(id).to_hash
			else
				fail "invalid identifier. Please supply an ID or summoner name"
			end
		end

		def self.by_name(name)
			get("/by-name/#{name}")
		end

		def self.by_id(id)
			get(id)
		end

		def get_names_by_ids(ids=[])
			get(ids.join(',') + '/name')
		end

		def masteries
			@masteries ||= self.class.get_masteries_by id: @id
		end

		def runes
			@runes ||= self.class.get_runes_by id: @id
		end

		def self.get_id(opts={})
			opts[:name] ? by_name(opts[:name]) : opts[:id]	
		end

		def self.get_masteries_by(opts={})
			get("/#{get_id(opts)}/masteries").to_hash
		end

		def self.get_runes_by(opts={})
			get("/#{get_id(opts)}/runes").to_hash
		end

		def self.get(o)
			super(o+"?api_key=#{RubyRiot::API_KEY}")
		end

	end
end