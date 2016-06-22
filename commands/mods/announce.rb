module FelyneBot
	module Commands
		module Announce
			extend Discordrb::Commands::CommandContainer
			command(
					:announce,
					description: "announces your text server-wide. (Probably shouldn't use this...)",
					usage: "announce <text>",
					min_args: 1,
					permission_level: 800,
					permission_message: "I'm sorry Dave, I cannot do that."
			) do |event, *text|
				bot_profile = event.bot.profile.on(event.server)
				text = text.join(' ')
				event.server.text_channels.each { |x| event.bot.send_message(x, text) }
				puts "#{event.timestamp}: #{event.user.name}: CMD: announce"
				nil
			end
		end
	end
end