module FelyneBot
	module Commands
		module Guild
			extend Discordrb::Commands::CommandContainer
			command(
					:guild,
					description: "Add user to guild",
					usage: "guild <Guildname>",
					min_args: 1,
					max_args: 1,
			) do |event, search|
				guilds = []
				guilds = loadArr(guilds,"bot/guilds")
				member = event.user.on(event.server)
				guild = 0
				if search == 'remove'
					guilds.each { |x| 
						role = event.server.roles.find { |role| role.name == x }
						member.remove_role(role)
					}
					event << "Removed from all guild server roles."
				else
					i=0
					begin
						if search == guilds[i]
							role = event.server.roles.find { |role| role.name == search }
							member.add_role(role)
							guild = 1
							i+=1
						end
					end while guilds[i]!=nil
					if guild == 1
						event << "Added to the #{search} guild server role"
					else
						event << "The requested guild server role does not exist.  If you would like to add your guild to the servers roles, please PM Reaver01"
					end
				end
				puts '#{event.timestamp}: #{event.user.name}: CMD: guild <#{search}>'
				nil
			end
		end
	end
end