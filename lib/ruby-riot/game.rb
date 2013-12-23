module RubyRiot
	class Game < APIModel
		VERSION = "v1.2"
		ID = 'game'
		set_base_uri VERSION, ID
	end
end