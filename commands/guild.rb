module FelyneBot
	module Commands
		module Guild
			extend Discordrb::Commands::CommandContainer
			command(:guild, min_args: 1, max_args: 1, description: 'Add user to guild', usage: "-guild <Guildname>  Guilds on server: Hipcheckers, Hyperlynx, Stygian, MHOInter, Discord, SG★Hunters, 血盟狩猎团, 月夜黑貓團, 为卿负天下、, Abysswalker, thelegionnaires, GatotKaca, LaTaverne, MooGoo") do |event, search|
				member = event.user.on(event.server)
				if search == 'Hipcheckers'
					role = event.server.roles.find { |role| role.name == "Hipcheckers" }
					member.add_role(role)
				end
				if search == 'Hyperlynx'
					role = event.server.roles.find { |role| role.name == "Hyperlynx" }
					member.add_role(role)
				end
				if search == 'Stygian'
					role = event.server.roles.find { |role| role.name == "Stygian" }
					member.add_role(role)
				end
				if search == 'MHOInter'
					role = event.server.roles.find { |role| role.name == "MHOInter" }
					member.add_role(role)
				end
				if search == 'Discord'
					role = event.server.roles.find { |role| role.name == "Discord" }
					member.add_role(role)
				end
				if search == 'SG★Hunters'
					role = event.server.roles.find { |role| role.name == "SG★Hunters" }
					member.add_role(role)
				end
				if search == '血盟狩猎团'
					role = event.server.roles.find { |role| role.name == "血盟狩猎团" }
					member.add_role(role)
				end
				if search == '月夜黑貓團'
					role = event.server.roles.find { |role| role.name == "月夜黑貓團" }
					member.add_role(role)
				end
				if search == '为卿负天下、'
					role = event.server.roles.find { |role| role.name == "为卿负天下、" }
					member.add_role(role)
				end
				if search == 'Abysswalker'
					role = event.server.roles.find { |role| role.name == "Abysswalker" }
					member.add_role(role)
				end
				if search == 'thelegionnaires'
					role = event.server.roles.find { |role| role.name == "thelegionnaires" }
					member.add_role(role)
				end
				if search == 'GatotKaca'
					role = event.server.roles.find { |role| role.name == "GatotKaca" }
					member.add_role(role)
				end
				if search == 'LaTaverne'
					role = event.server.roles.find { |role| role.name == "LaTaverne" }
					member.add_role(role)
				end
				if search == 'MooGoo'
					role = event.server.roles.find { |role| role.name == "MooGoo" }
					member.add_role(role)
				end
				nil
			end
		end
	end
end