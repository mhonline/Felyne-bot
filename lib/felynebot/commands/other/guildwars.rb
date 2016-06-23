module FelyneBot
	module Commands
		module GuildWars
			extend Discordrb::Commands::CommandContainer
			command(
					:guildwars,
			) do |event|
				guilds = []
				(1..$guilds.length).each { |i| guilds.push({"value"=>0, "name"=>$guilds[i-1].guild_name}) }
				(1..guilds.length).each { |i| 
					role = event.server.roles.find { |role| role.name == guilds[i-1]['name'] }.id
					members = event.server.members.select { |m| m.role?(role) }
					guilds[i-1]['value'] = members.length
				}
				sorted = guilds.sort_by { |k| k["value"] }.reverse
				(1..guilds.length).each { |i| 
					event << "Guild: #{sorted[i-1]['name']} | Members: #{sorted[i-1]['value']}"
				}
				puts "#{event.timestamp}: #{event.user.name}: CMD: guildwars"
				nil
			end
		end
	end
end

