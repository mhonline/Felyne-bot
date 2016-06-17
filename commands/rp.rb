module FelyneBot
	module Commands
		module RolePlay
			extend Discordrb::Commands::CommandContainer
			command(:rp) do |event, *phrase|
				roleplaytext = phrase.join(' ')
				event << "sent **#{roleplaytext}** to mhodiscussion"
				$bot.send_message(122526505606709257, roleplaytext)
				puts 'CMD: roleplay'
			end
		end
	end
end