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
				userid = $bot.parse_mention(uname).id
				username = $bot.parse_mention(uname).name
				if userid != nil
					if permarray.include? userid
						event << "User permissions found... Updating permissions."
					else
						event << "User permissions not found... Adding permissions."
					end
				else
					event << "Invalid user."
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: addmod"
				exit
				nil
			end
		end
	end
end