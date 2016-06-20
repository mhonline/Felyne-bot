module FelyneBot
	module Commands
		module Guild
			extend Discordrb::Commands::CommandContainer
			command(:guild, min_args: 1, max_args: 1, description: 'Add user to guild', usage: "-guild <Guildname>  Guilds on server: Hipcheckers, Hyperlynx, Stygian, MHOInter, Discord, SG★Hunters, 血盟狩猎团, 月夜黑貓團, 为卿负天下、, Abysswalker, thelegionnaires, GatotKaca, LaTaverne, MooGoo, TheHoldingPen, 花落阴影") do |event, search|
				member = event.user.on(event.server)
				guild = 0
				if search == 'remove'
					role = event.server.roles.find { |role| role.name == "Hipcheckers" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "Hyperlynx" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "Stygian" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "MHOInter" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "Discord" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "SG★Hunters" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "血盟狩猎团" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "月夜黑貓團" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "为卿负天下、" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "Abysswalker" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "thelegionnaires" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "GatotKaca" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "LaTaverne" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "MooGoo" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "TheHoldingPen" }
					member.remove_role(role)
					role = event.server.roles.find { |role| role.name == "花落阴影" }
					member.remove_role(role)
					event << "Removed from all guild server roles."
				else
					if search == 'Hipcheckers'
						role = event.server.roles.find { |role| role.name == "Hipcheckers" }
						member.add_role(role)
						guild = 1
					end
					if search == 'Hyperlynx'
						role = event.server.roles.find { |role| role.name == "Hyperlynx" }
						member.add_role(role)
						guild = 1
					end
					if search == 'Stygian'
						role = event.server.roles.find { |role| role.name == "Stygian" }
						member.add_role(role)
						guild = 1
					end
					if search == 'MHOInter'
						role = event.server.roles.find { |role| role.name == "MHOInter" }
						member.add_role(role)
						guild = 1
					end
					if search == 'Discord'
						role = event.server.roles.find { |role| role.name == "Discord" }
						member.add_role(role)
						guild = 1
					end
					if search == 'SG★Hunters'
						role = event.server.roles.find { |role| role.name == "SG★Hunters" }
						member.add_role(role)
						guild = 1
					end
					if search == '血盟狩猎团'
						role = event.server.roles.find { |role| role.name == "血盟狩猎团" }
						member.add_role(role)
						guild = 1
					end
					if search == '月夜黑貓團'
						role = event.server.roles.find { |role| role.name == "月夜黑貓團" }
						member.add_role(role)
						guild = 1
					end
					if search == '为卿负天下、'
						role = event.server.roles.find { |role| role.name == "为卿负天下、" }
						member.add_role(role)
						guild = 1
					end
					if search == 'Abysswalker'
						role = event.server.roles.find { |role| role.name == "Abysswalker" }
						member.add_role(role)
						guild = 1
					end
					if search == 'thelegionnaires'
						role = event.server.roles.find { |role| role.name == "thelegionnaires" }
						member.add_role(role)
						guild = 1
					end
					if search == 'GatotKaca'
						role = event.server.roles.find { |role| role.name == "GatotKaca" }
						member.add_role(role)
						guild = 1
					end
					if search == 'LaTaverne'
						role = event.server.roles.find { |role| role.name == "LaTaverne" }
						member.add_role(role)
						guild = 1
					end
					if search == 'MooGoo'
						role = event.server.roles.find { |role| role.name == "MooGoo" }
						member.add_role(role)
						guild = 1
					end
					if search == 'TheHoldingPen'
						role = event.server.roles.find { |role| role.name == "TheHoldingPen" }
						member.add_role(role)
						guild = 1
					end
					if search == '花落阴影'
						role = event.server.roles.find { |role| role.name == "花落阴影" }
						member.add_role(role)
						guild = 1
					end
					if guild == 1
						event << "Added to the #{search} guild server role"
					else
						event << "The requested guild server role does not exist.  If you would like to add your guild to the servers roles, please PM Reaver01"
					end
				end
				nil
			end
		end
	end
end