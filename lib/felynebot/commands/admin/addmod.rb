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
			) do |event, uname, level=1|
				permarray = []
				permarray = loadArr(permarray,"userbase/perm")
				$userid = $bot.parse_mention(uname).id
				$username = $bot.parse_mention(uname).name
				event << $userid
				event << $username
				event << level
				puts "#{event.timestamp}: #{event.user.name}: CMD: addmod"
				exit
				nil
			end
		end
	end
end