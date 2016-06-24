module FelyneBot
	module Commands
		module UserGuild
			extend Discordrb::Commands::CommandContainer
			command(
					:userguild,
					description: "Adds guild for user to the database.",
					usage: "userguild <set/remove/list> <guildname>",
					max_args: 2,
					min_args: 1
			) do |event, set, search|
				#Database function
				temp = $users.find_index {|s| s.id == event.user.id}
				#Roles function
				guilds = []
				(1..$guilds.length).each { |i|
					name_server = "#{$guilds[i-1].guild_name}    #{$guilds[i-1].guild_server}"
					guilds.push(name_server)
				}
				member = event.user.on(event.server)
				guild = 0
				if set == 'remove'
					guilds.each { |x| 
						role = member.roles.find { |role| role.name == x }
						if role!=nil
							member.remove_role(role)
						end
					}
					$users[temp].addGuild(" ")
					saveObj($users,"userbase/users")
					event << "Removed from all guild server roles, and cleared guild from Database"
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
					if  temp!=nil then $users[temp].addGuild(search) end
					event << "Changed guild to: #{guild}"
					saveObj($users,"userbase/users")
					event << "Added to the #{search} guild server role"
				else
					event << "The requested guild server role does not exist.  If you would like to add your guild to the servers roles, please PM Reaver01"
				end
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: userguild <#{set}> <#{search}>"
				nil
			end
		end
	end
end