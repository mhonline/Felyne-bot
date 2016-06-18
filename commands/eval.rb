module FelyneBot
	module Commands
		module Eval
			extend Discordrb::Commands::CommandContainer
			command(:eval, help_available: false, permission_level: 800) do |event, *code|
				begin
					eval code.join(' ')
				rescue
					"An error occured :x: "
				end
			end
		end
	end
end