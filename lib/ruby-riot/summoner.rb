module RubyRiot
	class Summoner < APIModel
		include HTTParty
		base_uri 'http://api.'
	end
end