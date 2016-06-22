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
						just1 = 15
						just2 = 30
						just3 = 45
						just4 = 60
						namel = found[i].name.to_s.length
						ignl = found[i].ign.to_s.length
						guildl = found[i].guild.to_s.length
						if found[i].name.to_s.contains_cjk?
							just1 = just1 - ((namel/4).floor)*3
							just2 = just2 - ((namel/4).floor)*3
							just3 = just3 - ((namel/4).floor)*3
							just4 = just4 - ((namel/4).floor)*3
						end
						if found[i].ign.to_s.contains_cjk?
							just2 = just2 - ((ignl/4).floor)*3
							just3 = just3 - ((ignl/4).floor)*3
							just4 = just4 - ((ignl/4).floor)*3
						end
						if found[i].guild.to_s.contains_cjk?
							just3 = just3 - ((guildl/4).floor)*3
							just4 = just4 - ((guildl/4).floor)*3
						end
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