module FelyneBot
	module Commands
		module UserIgn
			extend Discordrb::Commands::CommandContainer
			command(
					:userign,
					description: "Changes IGN for user in the database.",
					usage: "userign <IGN>",
					max_args: 1,
					min_args: 1
			) do |event, ign|
				temp = $users.find_index {|s| s.id == event.user.id}
				if  temp!=nil then $users[temp].addIgn(ign) end
				event << "Changed IGN to #{ign}"
				saveObj($users,"userbase/users")
				puts "#{event.timestamp}: #{event.user.name}: CMD: userign <#{ign}>"
				nil
			end
		end
	end
end