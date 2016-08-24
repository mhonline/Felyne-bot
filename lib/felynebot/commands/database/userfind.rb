module FelyneBot
	module Commands
		module UserFind
			extend Discordrb::Commands::CommandContainer
			command(
					:userfind,
					bucket: :delay10,
					description: "Finds a user on the database",
					useage: "userfind <search>",
					min_args: 1,
					max_args: 1
			) do |event, search|
				found=[]
				(1..$users.length).each { |i|
					if $users[i-1].id!=nil && $users[i-1].id==search then found.push($users[i-1]) end
					if $users[i-1].name!=nil && $users[i-1].name.downcase.include?(search.downcase) then found.push($users[i-1]) end
					if $users[i-1].ign!=nil && $users[i-1].ign.downcase.include?(search.downcase) then found.push($users[i-1]) end
					if $users[i-1].guild!=nil && $users[i-1].guild.downcase.include?(search.downcase) then found.push($users[i-1]) end
					if $users[i-1].timezone!=nil && $users[i-1].timezone.downcase.include?(search.downcase) then found.push($users[i-1]) end
					if $users[i-1].server!=nil && $users[i-1].server.downcase.include?(search.downcase) then found.push($users[i-1]) end
				}
				found.uniq!
				if !found.empty?
					event << "Found User Database:"
					event << "```ruby\nName           IGN            Guild          Timezone       Server"
					(1..found.length).each { |i|
						just1 = 15
						just2 = 30
						just3 = 45
						just4 = 60
						namel = found[i-1].name.to_s.length
						ignl = found[i-1].ign.to_s.length
						guildl = found[i-1].guild.to_s.length
						if found[i-1].name.to_s.contains_cjk?
							just1 = just1 - ((namel/4).floor)*3
							just2 = just2 - ((namel/4).floor)*3
							just3 = just3 - ((namel/4).floor)*3
							just4 = just4 - ((namel/4).floor)*3
						end
						if found[i-1].ign.to_s.contains_cjk?
							just2 = just2 - ((ignl/4).floor)*3
							just3 = just3 - ((ignl/4).floor)*3
							just4 = just4 - ((ignl/4).floor)*3
						end
						if found[i-1].guild.to_s.contains_cjk?
							just3 = just3 - ((guildl/4).floor)*3
							just4 = just4 - ((guildl/4).floor)*3
						end
						str = ""
						if found[i-1].name!=nil then str << "#{found[i-1].name.to_s}" end
						str=str.ljust(just1)
						if found[i-1].ign!=nil then str << "#{found[i-1].ign.to_s}" end
						str=str.ljust(just2)
						if found[i-1].guild!=nil then str << "#{found[i-1].guild.to_s}" end
						str=str.ljust(just3)
						if found[i-1].timezone!=nil then str << "#{found[i-1].timezone.to_s}" end
						str=str.ljust(just4)
						if found[i-1].server!=nil then str << "#{found[i-1].server.to_s}" end
						event << str
						i+=1
					}
					event << "```"
				else
					event.respond "Search string was not found in database."
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: userfind <#{search}>"
				nil
			end
		end
	end
end