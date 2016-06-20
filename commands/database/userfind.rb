module FelyneBot
	module Commands
		module UserFind
			extend Discordrb::Commands::CommandContainer
			command(
					:userfind,
					description: "Finds a user on the database",
					useage: "userfind <search>",
					min_args: 1,
					max_args: 1
			) do |event, search|
				i=0
				found=[]
				begin
					if $users[i].id!=nil && $users[i].id==search then found.push($users[i]) end
					if $users[i].name!=nil && $users[i].name.downcase.include?(search.downcase) then found.push($users[i]) end
					if $users[i].ign!=nil && $users[i].ign.downcase.include?(search.downcase) then found.push($users[i]) end
					if $users[i].guild!=nil && $users[i].guild.downcase.include?(search.downcase) then found.push($users[i]) end
					if $users[i].timezone!=nil && $users[i].timezone.downcase.include?(search.downcase) then found.push($users[i]) end
					if $users[i].server!=nil && $users[i].server.downcase.include?(search.downcase) then found.push($users[i]) end
					i+=1
				end while $users[i]!=nil
				found.uniq!
				if !found.empty?
					i=0
					event << "Found User Database:"
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
						if found[i].name!=nil then str << "#{found[i].name.to_s}" end
						str=str.ljust(just1)
						if found[i].ign!=nil then str << "#{found[i].ign.to_s}" end
						str=str.ljust(just2)
						if found[i].guild!=nil then str << "#{found[i].guild.to_s}" end
						str=str.ljust(just3)
						if found[i].timezone!=nil then str << "#{found[i].timezone.to_s}" end
						str=str.ljust(just4)
						if found[i].server!=nil then str << "#{found[i].server.to_s}" end
						event << str
						i+=1
					end while i < found.length
					event << "```"
				else
					event << "Search string was not found in database."
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: userfind"
				nil
			end
		end
	end
end