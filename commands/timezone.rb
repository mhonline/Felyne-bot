module FelyneBot
	module Commands
		module UserTimezone
			extend Discordrb::Commands::CommandContainer
			command(:usertimezone, max_args: 1, min_args: 0, description: "Adds timezone for user to the database.", usage: "-usertimezone <Timezone>") do |event, timezone=nil|
				temp = $users.find_index {|s| s.id == event.user.id}
				if  temp!=nil then $users[temp].addTimezone(timezone) end
				event << "Changed timezone to: #{timezone}"
				puts "#{event.timestamp}: #{event.user.name}: [userTimezone] <#{timezone}>"
				saveObj($users,"userbase/users")
				nil
			end
		end
	end
end