module MainBot
	module Commands
		module Qqnews
			extend Discordrb::Commands::CommandContainer
			command(
					:qqnews,
					description: "Manage raids for channel.",
					usage: "qqnews <sub/unsub>",
					help_available: true
			) do |event, option|
				isadmin = false
				event.user.roles.each do |permissions|
					if permissions.administrator
						isadmin = true
					end
				end
				if isadmin
					if option == "sub"
						
						event << "You have subscribed this channel to QQ MHO news"
					elsif option == "unsub"
						
						event << "You have unsubscribed this channel from QQ MHO news"
					end
				else
					event << "Only the admin of the server can subscribe a channel to QQ MHO news"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: raids"
				nil
			end
		end
	end
end
