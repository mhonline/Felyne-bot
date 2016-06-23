module FelyneBot
	module Commands
		module AddUser
			extend Discordrb::Commands::CommandContainer
			command(
					:adduser,
					description: "Adds a user the the database.",
					usage: "adduser <IGN>",
					min_args: 1,
					max_args: 1,
			) do |event, ign|
				tempUser = User.new(event.user.id, event.user.name, ign, $users, event.message.channel, $bot)
				saveObj($users,"/userbase/users")
				puts "#{event.timestamp}: #{event.user.name}: CMD: adduser <#{ign}>"
				nil
			end
		end
	end
end