module Commands
	module UserGuild
		extend Discordrb::Commands::CommandContainer
		command(
				:userguild,
				bucket: :delay10,
				description: "Adds guild for user to the database.",
				usage: "userguild <set/remove/list> <guildname>",
				max_args: 2,
				min_args: 1
		) do |event, set, search|
			#Database function
			temp = $users.find_index {|s| s.id == event.user.id}
			#Roles function
			guilds = []
			servers = []
			guilds2 = []
			(1..$guilds.length).each { |i|
				name_server = "#{$guilds[i-1].guild_name}        #{$guilds[i-1].guild_server}"
				guilds.push($guilds[i-1].guild_name)
				guilds2.push(name_server)
				servers.push({"name"=>"#{$guilds[i-1].guild_name}","server"=>"#{$guilds[i-1].guild_server}"})
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
				saveObj($users,"botfiles/users")
				event.respond "Removed from all guild server roles, and cleared guild from Database"
			end
			if set == 'list'
				event.channel.send_embed '', listGuilds(guilds2)
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
				if  temp!=nil 
					$users[temp].addGuild(search)
					(1..servers.length).each { |x|
						if servers[x-1]['name'] == search
							$users[temp].addServer(servers[x]['server'])
						end
					}
				end
				event.respond "Changed guild to: #{guild}"
				saveObj($users,"botfiles/users")
				event.respond "Added to the #{search} guild server role"
			else
				event.respond "The requested guild server role does not exist.  If you would like to add your guild to the servers roles, please PM Reaver01"
			end
			end
			puts "#{event.timestamp}: #{event.user.name}: CMD: userguild <#{set}> <#{search}>"
			nil
		end
	end
end