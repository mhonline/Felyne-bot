module FelyneBot
	module Commands
		module UserFind
			extend Discordrb::Commands::CommandContainer
			command(:userfind, min_args: 1, max_args: 1) do |event, search|
				i=0
				found=[]
				begin
					if $users[i].id!=nil && $users[i].id==search then found.push($users[i]) end
					if $users[i].name!=nil && $users[i].name.downcase.include?(search.downcase) then found.push($users[i]) end
					if $users[i].ign!=nil && $users[i].ign.downcase.include?(search.downcase) then found.push($users[i]) end
					if $users[i].guild!=nil && $users[i].guild.downcase.include?(search.downcase) then found.push($users[i]) end
					if $users[i].timezone!=nil && $users[i].timezone.downcase.include?(search.downcase) then found.push($users[i]) end
					i+=1
				end while $users[i]!=nil
				found.uniq!
				if !found.empty?
					i=0
					event << "Found User Database:"
					event << "```Name                IGN                 Guild               Timezone"
					begin
						str = ""
						if found[i].name!=nil then str << "#{found[i].name.to_s}" end
						str=str.ljust(20)
						if found[i].ign!=nil then str << "#{found[i].ign.to_s}" end
						str=str.ljust(40)
						if found[i].guild!=nil then str << "#{found[i].guild.to_s}" end
						str=str.ljust(60)
						if found[i].timezone!=nil then str << "#{found[i].timezone.to_s}" end
						event << str
						i+=1
					end while i < found.length
					event << "```"
				end
			end
		end
	end
end