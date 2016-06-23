module FelyneBot
	require_relative '/lib/felyne/bot/class/info'
	puts "Info Loaded"

	$users = []
	loadusers("/userbase/users")
	$guilds = []
	loadguilds("/userbase/guilds")
	info = Info.new('/bot/token','/bot/id')
	token = info.token
	id = info.id

	$prefix = '-'

	$bot = Discordrb::Commands::CommandBot.new token: token, application_id: id, prefix: $prefix, advanced_functionality: false
	puts "BOT Loaded"

#Loads permissions from array
	permarray = []
	permarray = loadArr(permarray,"/userbase/perm")

#Loading permissions array
	pos = 0
	begin
		$bot.set_user_permission(permarray[pos],permarray[pos+1])
		pos += 3
	end while pos < permarray.length
	puts "Permission Loaded!"

#Admin/Troubleshooting
	$bot.include! Commands::Eval
	$bot.include! Commands::Info
	$bot.include! Commands::Kill
	$bot.include! Commands::Ping
#IGN/Guild/Timezone Database
	$bot.include! Commands::AddUser
	$bot.include! Commands::UserFind
	$bot.include! Commands::UserGuild
	$bot.include! Commands::UserIgn
	$bot.include! Commands::UserList
	$bot.include! Commands::UserRemove
	$bot.include! Commands::UserServer
	$bot.include! Commands::UserTimezone
#Helpful Commands
	$bot.include! Commands::Help
	$bot.include! Commands::Maint
	$bot.include! Commands::Reset
	$bot.include! Commands::Server
	$bot.include! Commands::Server47
	$bot.include! Commands::Wiki
#Mod only
	$bot.include! Commands::Announce
	$bot.include! Commands::Avatar
	$bot.include! Commands::Game
	$bot.include! Commands::MainSetup
	$bot.include! Commands::NewGuild
	$bot.include! Commands::RolePlay
#User Role
	$bot.include! Commands::UserRaid
	$bot.include! Commands::Guild
#Raids
	$bot.include! Commands::Raid
	$bot.include! Commands::Raid1
	$bot.include! Commands::Raid2
	$bot.include! Commands::Raid3
	$bot.include! Commands::Raid4
	$bot.include! Commands::Raid5
#User Role
	$bot.include! Commands::Guild
	$bot.include! Commands::UserRaid
#Other <not in fullhelp>
	$bot.include! Commands::Danger
	$bot.include! Commands::GuildWars
	$bot.include! Commands::Roll

#Fun Commands
	$bot.message(containing: "(╯°□°）╯︵ ┻━┻") { |event|
		event << "┬─┬﻿ ノ( ゜-゜ノ)"
	}
	$bot.message(containing: "Open the pod bay doors") { |event|
		role = event.server.roles.find { |role| role.name == "Felyne" }
		newcolor = '0x'
		newcolor << IO.readlines("/bot/colors")[0]
		newcolor = newcolor.gsub("\n","").hex
		role.color = Discordrb::ColorRGB.new(newcolor)
		$bot.profile.avatar = File.open("/pic/HAL9000.png")
		event << "Im sorry Dave, Im afraid I cant do that.'"
	}
	$bot.message(containing: "┬─┬﻿ ノ( ゜-゜ノ)") { |event|
		event << "(╯°□°）╯︵ ┻━┻"
	}
	$bot.message(containing: "g") { |event|
		gcount = IO.readlines("/bot/gcount")[0]
		if gcount == nil
			gcount = 0
		end
		gcount = gcount.to_i
		gcount += 1
		if gcount == 100
			event << "Annihilation Program Loading... 10%"
		end
		if gcount == 200
			event << "Annihilation Program Loading... 20%"
		end
		if gcount == 300
			event << "Annihilation Program Loading... 30%"
		end
		if gcount == 400
			event << "Annihilation Program Loading... 40%"
		end
		if gcount == 500
			event << "Annihilation Program Loading... 50%"
		end
		if gcount == 600
			event << "Annihilation Program Loading... 60%"
		end
		if gcount == 700
			event << "Annihilation Program Loading... 70%"
		end
		if gcount == 800
			event << "Annihilation Program Loading... 80%"
		end
		if gcount == 900
			event << "Annihilation Program Loading... 90%"
		end
		if gcount == 1000
			hexlist = ["a","b","c","d","e","f","0","1","2","3","4","5","6","7","8","9"]
			event << "Annihilation Program Loading... 100%"
			event << "Annihilation Commencing"
			guilds = []
			(1..$guilds.length).each { |i| guilds.push($guilds[i-1].guild_name) }
			guilds.each { |x| 
				role = event.server.roles.find { |role| role.name == x }
				newcolor = "0x#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}".hex
				role.color = Discordrb::ColorRGB.new(newcolor)
			}
			event << "Annihilation Complete... Reseting"
			gcount = 0
		end
		File.write('/bot/gcount', gcount)
	}

	puts "Commands Loaded"
	$bot.debug = false
	$bot.run :async
	$bot.game = IO.readlines("/bot/game")[0]
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	$bot.sync
end
