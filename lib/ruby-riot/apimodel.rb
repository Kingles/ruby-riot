module RubyRiot
	class APIModel
		include HTTParty
		base_uri RubyRiot::base_uri

		def self.set_base_uri(v,i)
			base_uri base_uri + '/' + v + '/' + i
		end

		def self.get(o)
			puts base_uri + o
			super o
		end
	end
end