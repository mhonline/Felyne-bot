module FelyneBot
	module Commands
		module UserRaid
			extend Discordrb::Commands::CommandContainer
			command(:userraid, min_args: 1, max_args: 1, description: 'Add user to Raid Ready server role', usage: "-raidready <yes/no>") do |event, search|
				member = event.user.on(event.server)
				if search == 'yes'
					role = event.server.roles.find { |role| role.name == "RaidReady" }
					member.add_role(role)
					event << "Added to RaidReady Role"
				end
				if search == 'no'
					role = event.server.roles.find { |role| role.name == "RaidReady" }
					member.remove_role(role)
					event << "Removed from RaidReady Role"
				nil
				end
			end
		end
	end
end