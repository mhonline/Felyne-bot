module FelyneBot
	module Commands
		module Help
			extend Discordrb::Commands::CommandContainer
			command(
					:help,
					description: "Shows all commands. If command is added will show the description",
					useage: "help <command>"
			) do |event, more|
				admin = []
				database = []
				helpful = []
				mods = []
				raids = []
				roles = []
				Dir["commands/admin/*.rb"].each {|basename| admin.push(basename) }
				Dir["commands/database/*.rb"].each {|basename| database.push(basename) }
				Dir["commands/helpful/*.rb"].each {|basename| helpful.push(basename) }
				Dir["commands/mods/*.rb"].each {|basename| mods.push(basename) }
				Dir["commands/raids/*.rb"].each {|basename| raids.push(basename) }
				Dir["commands/roles/*.rb"].each {|basename| roles.push(basename) }
				if more == nil
					more = "none"
					out = "```#IGN/Guild/Timezone Database\n"
					database.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Helpful Commands\n"
					helpful.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Role Commands\n"
					roles.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Raids\n"
					raids.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Mod only\n"
					mods.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "#Admin/Troubleshooting\n"
					admin.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\nTo get more info about a specific command type: #{$prefix}help <command>```"
				else
					search = more.to_sym
					if $bot.commands[search] != nil
						desc = $bot.commands[search].attributes[:description]
						useage = $bot.commands[search].attributes[:usage]
						out = "#{$prefix}#{more}: ``#{desc}``"
						if useage != nil
							out << "\nUseage: ``#{$prefix}#{useage}``"
						end
					else
						out = "No such command exists."
					end
				end
				event << out
				puts '#{event.timestamp}: #{event.user.name}: CMD: help'
				nil
			end
		end
	end
end