module RubyRiot
	class Champion < APIModel
		VERSION = "v1.1"
		ID = 'champion'
		set_base_uri VERSION, ID
	end
end