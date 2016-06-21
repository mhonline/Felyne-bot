module FelyneBot
	module Commands
		module NewGuild
			extend Discordrb::Commands::CommandContainer
			command(
					:newguild,
					description: "Adds a user guild to the guilds database.",
					usage: "newguild <GuildName>",
					min_args: 1,
					max_args: 1,
			) do |event, search|
				role = event.server.roles.find { |role| role.name == search }
				tempGuild = Guild.new(role, search, $guilds, event.message.channel, $bot)
				saveObj($guilds,"userbase/guilds")
				puts "#{event.timestamp}: #{event.user.name}: CMD: newguild <#{ign}>"
				nil
			end
		end
	end
end