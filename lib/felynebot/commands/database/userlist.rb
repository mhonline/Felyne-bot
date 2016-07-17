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
				if $users.length == 0 then event.respond "User table is empty!"
				else
				pages=$users.length/9
				if pages<1 then pages=1 end
				if page>=pages then page=0 end
				i=($users.length/pages)*page
				event.respond "User Database:"
				event.respond "```ruby\nName           IGN            Guild          Timezone       Server"
				begin
					just1 = 15
					just2 = 30
					just3 = 45
					just4 = 60
					namel = $users[i].name.to_s.length
					ignl = $users[i].ign.to_s.length
					guildl = $users[i].guild.to_s.length
					if $users[i].name.to_s.contains_cjk?
						just1 = just1 - ((namel/4).floor)*3
						just2 = just2 - ((namel/4).floor)*3
						just3 = just3 - ((namel/4).floor)*3
						just4 = just4 - ((namel/4).floor)*3
					end
					if $users[i].ign.to_s.contains_cjk?
						just2 = just2 - ((ignl/4).floor)*3
						just3 = just3 - ((ignl/4).floor)*3
						just4 = just4 - ((ignl/4).floor)*3
					end
					if $users[i].guild.to_s.contains_cjk?
						just3 = just3 - ((guildl/4).floor)*3
						just4 = just4 - ((guildl/4).floor)*3
					end
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
					event.respond str
					i+=1
				end while i < ($users.length/pages)*(page+1)
					event.respond "```"
					event.respond "Showing page #{page+1}/#{pages}"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: userlist <#{page}>"
				nil
			end
		end
	end
end