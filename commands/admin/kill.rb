module FelyneBot
	module Commands
		module Kill
			extend Discordrb::Commands::CommandContainer
			command(
					:kill,
					description: "Kills felyne",
					useage: "kill",
					permission_level: 800,
					permission_message: "I'm sorry #{event.user.name}, I cannot do that."
			) do |event|
				puts "Daisy... daisy, give me your answer do..."
				$bot.send_message(event.message.channel, "Daisy... daisy, give me your answer do...")
				$bot.stop
				exit
				nil
			end
		end
	end
end