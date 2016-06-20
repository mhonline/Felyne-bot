module FelyneBot
	module Commands
		module UserServer
			extend Discordrb::Commands::CommandContainer
			command(:userserver, max_args: 1, min_args: 0, description: "Adds server for user to the database.", usage: "-userserver <server>") do |event, server=nil|
				temp = $users.find_index {|s| s.id == event.user.id}
				if  temp!=nil then $users[temp].addserver(server) end
				event << "Changed server to: #{server}"
				puts "#{event.timestamp}: #{event.user.name}: [userserver] <#{server}>"
				saveObj($users,"userbase/users")
				nil
			end
		end
	end
end