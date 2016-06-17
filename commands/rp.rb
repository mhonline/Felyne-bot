module FelyneBot
	module Commands
		module RolePlay
			extend Discordrb::Commands::CommandContainer
			command(:rp) do |event, phrase|
				event << "sent **#{phrase}** to mhodiscussion"
				bot.send_message(122526505606709257, phrase)
				puts 'CMD: roleplay'
			end
		end
	end
end