module FelyneBot
	module Commands
		module Guild
			extend Discordrb::Commands::CommandContainer
			command(
					:guild,
					description: "Add user to guild",
					usage: "guild <set/remove/list> <guildname",
					min_args: 1,
					max_args: 2
			) do |event, set, search|
				guilds = []
				(1..$guilds.length).each { |i| guilds.push($guilds[i-1].guild_name) }
				member = event.user.on(event.server)
				guild = 0
				if set == 'remove'
					guilds.each { |x| 
						role = member.roles.find { |role| role.name == x }
						if role!=nil
							member.remove_role(role)
						end
					}
					event << "Removed from all guild server roles."
				end
				if set == 'list'
					event << "``Guild roles currently set up:``"
					guilds.each { |x| event << x }
				end
				if set == 'set'
					guilds.each { |x| 
						role = member.roles.find { |role| role.name == x }
						if role!=nil
							member.remove_role(role)
						end
					}
					guilds.each { |x|
						if search == x
							role = event.bot.server(122526505606709257).roles.find { |role| role.name == search }
							member.add_role(role)
							guild = 1
						end
					}
				if guild == 1
					event << "Added to the #{search} guild server role"
				else
					event << "The requested guild server role does not exist.  If you would like to add your guild to the servers roles, please PM Reaver01"
				end
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: guild <#{set}> <#{search}>"
				nil
			end
		end
	end
end