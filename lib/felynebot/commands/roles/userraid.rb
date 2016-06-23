module FelyneBot
	module Commands
		module UserRaid
			extend Discordrb::Commands::CommandContainer
			command(
					:userraid,
					description: "Add user to Raid Ready server role",
					usage: "userraid <yes/no>",
					min_args: 1,
					max_args: 1
			) do |event, search|
				member = event.user.on(event.server)
				if search == 'yes'
					role = event.bot.server(122526505606709257).roles.find { |role| role.name == "RaidReady" }
					member.add_role(role)
					event << "Added to RaidReady Role"
				end
				if search == 'no'
					role = event.bot.server(122526505606709257).roles.find { |role| role.name == "RaidReady" }
					member.remove_role(role)
					event << "Removed from RaidReady Role"
				nil
				puts "#{event.timestamp}: #{event.user.name}: CMD: userraid <#{search}>"
				end
			end
		end
	end
end