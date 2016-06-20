<<<<<<< HEAD
module FelyneBot
	module Commands
		module Help
			extend Discordrb::Commands::CommandContainer
			command(:help, description: 'Shows all commands') do |event|
				event <<  "**#Admin/Troubleshooting**"
				event <<  "``-ping``"
				event <<  "``-kill``"
				event <<  "**#IGN/Guild/Timezone Database**"
				event <<  "``-adduser``"
				event <<  "``-userign``"
				event <<  "``-userguild``"
				event <<  "``-usertimezone``"
				event <<  "``-userremove``"
				event <<  "``-userlist``"
				event <<  "``-userfind``"
				event <<  "**#Helpful Commands**"
				event <<  "``-reset``"
				event <<  "``-server``"
				event <<  "``-server47``"
				event <<  "``-maint``"
				event <<  "``-help``"
				event <<  "**#User Role**"
				event <<  "``-userraid``"
				event <<  "``-guild``"
				event <<  "**#Raids**"
				event <<  "``-raid``"
				event <<  "``-raid1``"
				event <<  "``-raid2``"
				event <<  "``-raid3``"
				event <<  "``-raid4``"
				event <<  "``-raid5``"
				event <<  "**#Mod only**"
				event <<  "``-mainsetup``"
				event <<  "``-rp``"
				event <<  "``-avatar``"
				event <<  "``-game``"
				event <<  "``-eval``"
				nil
			end
		end
	end
=======
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
					out << "\nTo get more info about a specific command type: #{$prefix}help <command>```"
				else
					search = more.to_sym
					if $bot.commands[search] != nil
						desc = $bot.commands[search].attributes[:description]
						useage = $bot.commands[search].attributes[:usage]
						out = "#{$prefix}#{more}: ``#{desc}``"
						if useage != nil
							out << "\nUseage: ``#{useage}``"
						end
					else
						out = "No such command exists."
					end
				end
				event << out
				nil
			end
		end
	end
>>>>>>> parent of 6ddb13e... Messed up order
end