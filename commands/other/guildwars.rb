module FelyneBot
	module Commands
		module GuildWars
			extend Discordrb::Commands::CommandContainer
			command(
					:guildwars,
			) do |event|
				guilds = []
				(1..$guilds.length).each { |i| guilds.push([$guilds[i-1].guild_name, 0]) }
				member = event.user.on(event.server)
				(1..guilds.length).each { |i| 
					role = event.server.roles.find { |role| role.name == guilds.[i-1][0] }.id
					members = event.server.members.select { |m| m.role?(role) }
					guilds[i-1][1] = members.length
					event << "Guild: #{guilds[i-1][0]} | Members: #{guilds[i-1][1]}"
				}		
				nil
			end
		end
	end
end

