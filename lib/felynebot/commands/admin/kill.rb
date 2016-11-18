module FelyneBot
	module Commands
		module Kill
			extend Discordrb::Commands::CommandContainer
			command(
					:kill,
					description: "Kills felyne",
					useage: "kill",
					help_available: false,
					permission_level: 800,
					permission_message: "I'm sorry Dave, I cannot do that.",
			) do |event|
				puts "#{event.timestamp}: #{event.user.name}: CMD: kill"
				$bot.send_message(event.message.channel, "Daisy... daisy, give me your answer do...")
				$bot.stop
				exit
				nil
			end
		end
	end
end
