module FelyneBot
	module Commands
		module NewGuild
			extend Discordrb::Commands::CommandContainer
			command(
					:newguild,
					description: "Adds a guild to the guild array.",
					usage: "newguild <guild>",
					permission_level: 800,
					min_args: 1,
					max_args: 1,
			) do |event, guild|
				guilds = []
				guilds = loadArr(guilds,"bot/guilds")
				guilds.push(guild)
				File.write('bot/guilds', guilds)
				puts "#{event.timestamp}: #{event.user.name}: CMD: newguild"
				nil
			end
		end
	end
end