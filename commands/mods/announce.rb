module FelyneBot
	module Commands
		module Announce
			extend Discordrb::Commands::CommandContainer
			command(
					:announce,
					description: "announces your text server-wide.",
					usage: "announce <text>",
					min_args: 1,
					permission_level: 1,
			) do |event, *text|
				bot_profile = event.bot.profile.on(event.server)
				text = text.join(' ')
				event.server.text_channels.each do |channel|
					next
					channel.send_message("**#{event.author.username}**: #{text}")
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: announce"
				nil
			end
		end
	end
end