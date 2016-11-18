module FelyneBot
	module Commands
		module RolePlay
			extend Discordrb::Commands::CommandContainer
			command(
					:rp,
					description: "Nothing to see here.",
					useage: "rp <text>",
					help_available: false,
					permission_level: 2,
					permission_message: "I'm sorry Dave, I cannot do that."
			) do |event, *phrase|
				roleplaytext = phrase.join(' ')
				event.respond "sent **#{roleplaytext}** to mhodiscussion"
				$bot.send_message(122526505606709257, roleplaytext)
				puts "#{event.timestamp}: #{event.user.name}: CMD: rp <#{roleplaytext}>"
				nil
			end
		end
	end
end
