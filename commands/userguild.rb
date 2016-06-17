module FelyneBot
	module Commands
		module UserGuild
			extend Discordrb::Commands::CommandContainer
			command(:userguild, max_args: 1, min_args: 0, description: "Adds guild for user to the database.", usage: "-userguild <guildname>") do |event, guild=nil|
				temp = $users.find_index {|s| s.id == event.user.id}
				if  temp!=nil then $users[temp].addGuild(guild) end
					event << "Changed guild to: #{guild}"
					puts "#{event.timestamp}: #{event.user.name}: [userGuild] <#{guild}>"
					saveObj($users,"userbase/users")
				end
				nil
			end
		end
	end
end