module FelyneBot
	module Commands
		module UserList
			extend Discordrb::Commands::CommandContainer
			command(:userlist, min_args: 0, max_args: 1, description: "Shows the user database.") do |event, page=1|
				page=page.to_i-1
				if page<0 then page=0 end
				if $users.length == 0 then event << "User table is empty!"
				else
				pages=$users.length/9
				if pages<1 then pages=1 end
				if page>=pages then page=0 end
				i=($users.length/pages)*page
				event << "User Database:"
				event << "```Name                IGN                 Guild               Timezone"
				begin
					str = ""
					if $users[i].name!=nil then str << "#{$users[i].name.to_s}" end
					str=str.ljust(20)
					if $users[i].ign!=nil then str << "#{$users[i].ign.to_s}" end
					str=str.ljust(40)
					if $users[i].guild!=nil then str << "#{$users[i].guild.to_s}" end
					str=str.ljust(60)
					if $users[i].timezone!=nil then str << "#{$users[i].timezone.to_s}" end
					event << str
					i+=1
				end while i < ($users.length/pages)*(page+1)
					event << "```"
					event << "Showing page #{page+1}/#{pages}"
				end
				puts "#{event.timestamp}: #{event.user.name}: -userlist <#{page}>"
				nil
			end
		end
	end
end
