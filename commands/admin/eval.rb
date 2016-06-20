module FelyneBot
	module Commands
		module Eval
			extend Discordrb::Commands::CommandContainer
			command(
					:eval,
					description: "Evaluates code.",
					useage: "eval <code>",
					help_available: false,
					permission_level: 800
			) do |event, *code|
				begin
					eval code.join(' ')
				rescue StandardError => e
					event.respond(e.to_s)
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: eval"
				nil
			end
		end
	end
end