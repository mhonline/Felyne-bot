module MainBot
	module Commands
		module Daily
			extend Discordrb::Commands::CommandContainer
			command(
					:daily,
					description: "Manage Daily reset subscription for channel.",
					usage: "daily <sub/unsub>",
					help_available: true
			) do |event, option|
				isadmin = false
				event.user.roles.each do |x|
					if x.permissions.administrator
						isadmin = true
					end
				end
				if isadmin
					if option == "sub"
						$daily[event.channel.id.to_s] = true
						event << "You have subscribed this channel to Daily reset news"
					elsif option == "unsub"
						$daily.delete(event.channel.id.to_s)
						event << "You have unsubscribed this channel from QQ MHO news"
					end
					File.open('botfiles/daily.json', 'w') { |f| f.write $daily.to_json }
				else
					event << "Only an admin can subscribe a channel to Daily reset news"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: daily"
				nil
			end
		end
	end
end
