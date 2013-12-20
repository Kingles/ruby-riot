module RubyRiot
	class APIModel
		include HTTParty
		base_uri = RubyRiot::BASE_URI
	end
end