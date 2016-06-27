module FelyneBot
	module Commands
		module AddMod
			extend Discordrb::Commands::CommandContainer
			command(
					:addmod,
					description: "Kills felyne",
					useage: "addmod <@name> <level>",
					permission_level: 800,
					min_args: 1,
					max_args: 2,
					permission_message: "I'm sorry Dave, I cannot do that.",
			) do |event, uname, level|
				permarray = []
				permarray = loadArr(permarray,"userbase/perm")
				if $bot.parse_mention(uname) !=nil
					userid = $bot.parse_mention(uname).id
					username = $bot.parse_mention(uname).name
					if permarray.include? userid
						event << "User permissions found... Updating permissions."
						permarray.each { |i| 
							if permarray[i] == userid
								curlevel = permarray[i+2]
								event << "current permissions level: #{curlevel}"
							end
						}
					else
						event << "User permissions not found... Adding permissions."
					end
				else
					event << "Invalid user."
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: addmod"
				nil
			end
		end
	end
end