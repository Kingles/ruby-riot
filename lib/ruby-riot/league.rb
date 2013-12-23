module RubyRiot
	class League < APIModel
		VERSION = "v2.2"
		ID = 'league'
		set_base_uri VERSION, ID
	end
end