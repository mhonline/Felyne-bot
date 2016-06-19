module FelyneBot
	module Commands
		module Help
			extend Discordrb::Commands::CommandContainer
			command(:help, description: 'Shows all commands') do |event, more|
				admin = ['ping', 'kill']
				database = ['adduser', 'userign', 'userguild', 'usertimezone', 'userremove', 'userlist', 'userfind']
				helpful = ['reset', 'server', 'server47', 'maint', 'help']
				roles = ['userraid', 'guild']
				raids = ['raid', 'raid1', 'raid2', 'raid3', 'raid4', 'raid5']
				mods = ['mainsetup', 'rp', 'avatar', 'game', 'eval']
				if more == nil
					more = "none"
					out = "```#Admin/Troubleshooting\n"
					admin.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Admin/Troubleshooting\n"
					database.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#IGN/Guild/Timezone Database\n"
					helpful.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Helpful Commands\n"
					roles.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Raids\n"
					raids.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "\n#Mod only\n"
					mods.each { |x| out << "	#{$prefix}#{x}\n" }
					out << "```"
				else
					search = more.to_sym
					desc = $bot.commands[search].attributes[:description]
					useage = $bot.commands[search].attributes[:usage]
					out = "#{$prefix}#{more}: ``#{desc}``\nUseage: ``#{useage}``"
				end
				event << out
				nil
			end
		end
	end
end