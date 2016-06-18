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
end