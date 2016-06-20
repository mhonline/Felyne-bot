module FelyneBot
	module Commands
		module UserList
			extend Discordrb::Commands::CommandContainer
			command(
					:userlist,
					description: "Shows the user database.",
					useage: "userlist",
					min_args: 0,
					max_args: 1
			) do |event, page=1|
				page=page.to_i-1
				if page<0 then page=0 end
				if $users.length == 0 then event << "User table is empty!"
				else
				pages=$users.length/9
				if pages<1 then pages=1 end
				if page>=pages then page=0 end
				i=($users.length/pages)*page
				event << "User Database:"
				event << "```Name           IGN            Guild          Timezone       Server"
				begin
					namel = found[i].name.to_s.length
					ignl = found[i].ign.to_s.length
					guildl = found[i].guild.to_s.length
					namec = found[i].name.to_s
					ignc = found[i].ign.to_s
					guildc = found[i].guild.to_s
					just1 = 15
					just2 = 30
					just3 = 45
					just4 = 60
					if namec then just2 = just2 - namel/2 end
					if ignc then just3 = just3 - ignl/2 end
					if guildc then just4 = just4 - guildl/2 end
					str = ""
					if $users[i].name!=nil then str << "#{$users[i].name.to_s}" end
					str=str.ljust(just1)
					if $users[i].ign!=nil then str << "#{$users[i].ign.to_s}" end
					str=str.ljust(just2)
					if $users[i].guild!=nil then str << "#{$users[i].guild.to_s}" end
					str=str.ljust(just3)
					if $users[i].timezone!=nil then str << "#{$users[i].timezone.to_s}" end
					str=str.ljust(just4)
					if $users[i].server!=nil then str << "#{$users[i].server.to_s}" end
					event << str
					i+=1
				end while i < ($users.length/pages)*(page+1)
					event << "```"
					event << "Showing page #{page+1}/#{pages}"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: userlist <#{page}>"
				nil
			end
		end
	end
end