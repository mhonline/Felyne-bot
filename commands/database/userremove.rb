module FelyneBot
	module Commands
		module UserRemove
			extend Discordrb::Commands::CommandContainer
			command(
					:userremove,
					description: "Removes user from the database.",
					usage: "userremove",
					max_args: 0,
					min_args: 0
			) do |event|
				temp = $users.find_index {|s| s.id == event.user.id}
				if  temp!=nil
					event << "Found #{event.user.name}"
					$users=$users[0,temp].push(*$users.drop(temp+1))
					event << "Removed"
					saveObj($users, "userbase/users")
				else
					event << "No user found."
				end
				puts '#{event.timestamp}: #{event.user.name}: CMD: userremove'
				nil
			end
		end
	end
end