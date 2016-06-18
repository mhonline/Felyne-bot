module FelyneBot
	module Commands
		module Eval
			extend Discordrb::Commands::CommandContainer
			command(:eval, help_available: false, permission_level: 800) do |event, *code|
				begin
					eval code.join(' ')
				rescue e => StandardError
					event.respond(e.to_s)
				end
			end
		end
	end
end