module Commands
	module AddUser
		extend Discordrb::Commands::CommandContainer
		command(
				:useradd,
				bucket: :delay10,
				description: "Adds a user the the database.",
				usage: "useradd <IGN>",
				min_args: 1,
				max_args: 1,
		) do |event, ign|
			tempUser = User.new(event.user.id, event.user.name, ign, $users, event.message.channel, $bot)
			saveObj($users,"botfiles/users")
			puts "#{event.timestamp}: #{event.user.name}: CMD: useradd <#{ign}>"
			nil
		end
	end
end