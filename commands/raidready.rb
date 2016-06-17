module FelyneBot
	module Commands
		module RaidReady
			extend Discordrb::Commands::CommandContainer
			command(:raidready, min_args: 1, max_args: 1, description: 'Add user to Raid Ready server role', usage: "-raidready <yes/no>") do |event, search|
				member = event.user.on(event.server)
				if search == 'yes'
					role = event.server.roles.find { |role| role.name == "Raid Ready" }
					member.add_role(role)
				end
				if search == 'no'
					role = event.server.roles.find { |role| role.name == "Raid Ready" }
					member.remove_role(role)
				end
			end
		end
	end
end