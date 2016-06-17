module FelyneBot
	module Commands
		module RolePlay
			extend Discordrb::Commands::CommandContainer
			command(:rp) do |_event, phrase|
				event << "sent **#{phrase.join(' ')}** to mhodiscussion"
				bot.send_message(122526505606709257, phrase)
				puts 'CMD: roleplay'
			end
		end
	end
end