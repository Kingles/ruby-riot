require 'debugger'

module RubyRiot
	class Summoner < APIModel
		attr_reader :id, :name, :level, :profile_icon_id
		VERSION = 'v1.2'
		ID = 'summoner'
		set_base_uri VERSION, ID

		def initialize(id)
			@res = get_id id
			setprops
		end

		def setprops
			@name = @res['name']
			@id = @res['id']
			@level = @res['summonerLevel']
			@profile_icon_id = @res['profileIconId']
			@res['accessDate'] = Date.today
			DB.set! @id, @res
		end

		def force
			@res = get_id id,true
			setprops
		end

		def get_from_db(id)
			
		end

		def get_id(id, force=nil)
			if id.class == Fixnum || id.to_i != 0 
				force ? self.class.by_id(id.to_i).to_hash : DB.select{|key,val| val['id'] == id.to_i && ((val['summonerLevel'] == 30 || Time.at(val['accessDate']/1000) < RubyRiot::refresh_date)) }[0][1] || self.class.by_id(id.to_i).to_hash
			elsif id.class == String
				force ? self.class.by_name(id).to_hash : DB.select{|key,val| val['name'] =~ /#{id}/i && is_time_to_update? string: id}[0][1] || self.class.by_name(id).to_hash
			else
				fail "invalid identifier. Please supply an ID or summoner name"
			end
		end

		def is_time_to_update?(opts={})
			 ((val['summonerLevel'] == 30 || Time.at(val['revisionDate']/1000) < RubyRiot::refresh_date || Time.at(val['revisionDate']/1000) < RubyRiot::long_refresh_date))
		end

		def self.by_name(name)
			get("/by-name/#{name}")
		end

		def self.by_id(id)
			get('/' + id.to_s)
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
			super(o.to_s+"?api_key=#{RubyRiot::API_KEY}")
		end

	end
end