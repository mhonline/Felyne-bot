module FelyneBot
	module Commands
		module GuildWars
			extend Discordrb::Commands::CommandContainer
			command(
					:guildwars,
			) do |event|
				guilds = []
				(1..$guilds.length).each { |i| guilds.push(["guild_name": $guilds[i-1].guild_name, "members": 0]) }
				member = event.user.on(event.server)
				(1..guilds.length).each { |i| 
					role = event.server.roles.find { |role| role.name == guilds.guild_name[i-1] }.id
					members = event.server.members.select { |m| m.role?(role) }
					guilds.members[i-1] = members.length
					event << "Guild: #{guilds.guild_name} | Members: #{guilds.members}"
				}		
				nil
			end
		end
	end
end

