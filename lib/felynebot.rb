module FelyneBot
	require_relative 'felynebot/class/info'
	puts "Info Loaded"

	$mess = []
	$users = []
	$guilds = []
	loadusers("userbase/users")
	loadmess("userbase/mess")
	loadguilds("userbase/guilds")
	p $mess
	info = Info.new('bot/token','bot/id')
	token = info.token
	id = info.id

	$prefix = '-'

	$bot = Discordrb::Commands::CommandBot.new token: token, application_id: id, prefix: $prefix, advanced_functionality: false
	puts "BOT Loaded"

#Loads permissions from array
	permarray = []
	permarray = loadArr(permarray,"userbase/perm")

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
	$bot.include! Commands::Annihilation
	$bot.include! Commands::Danger
	$bot.include! Commands::GuildWars
	$bot.include! Commands::Roll
	$bot.include! Commands::Last

#Fun Commands
	$bot.message(containing: "(╯°□°）╯︵ ┻━┻") { |event|
		event << "┬─┬﻿ ノ( ゜-゜ノ)"
	}
	$bot.message(containing: "Open the pod bay doors") { |event|
		role = event.bot.server(122526505606709257).roles.find { |role| role.name == "Felyne" }
		newcolor = '0x'
		newcolor << IO.readlines("bot/colors")[0]
		newcolor = newcolor.gsub("\n","").hex
		role.color = Discordrb::ColorRGB.new(newcolor)
		$bot.profile.avatar = File.open("pic/HAL9000.png")
		event << "Im sorry Dave, Im afraid I cant do that.'"
	}
	$bot.message(containing: "┬─┬﻿ ノ( ゜-゜ノ)") { |event|
		event << "(╯°□°）╯︵ ┻━┻"
	}
	$bot.message(containing: "g") { |event|
		if File.file?("bot/gcount")
			gcount = IO.readlines("bot/gcount")[0]
		else
			gcount=0
		end
		gcount = gcount.to_i
		gcount += 1
		#puts "Number of g's in chat: #{gcount}"
		if gcount == 100 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 10%");puts gcount end
		if gcount == 200 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 20%");puts gcount end
		if gcount == 300 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 30%");puts gcount end
		if gcount == 400 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 40%");puts gcount end
		if gcount == 500 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 50%");puts gcount end
		if gcount == 600 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 60%");puts gcount end
		if gcount == 700 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 70%");puts gcount end
		if gcount == 800 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 80%");puts gcount end
		if gcount == 900 then $bot.send_message(122526505606709257, "Annihilation Program Loading... 90%");puts gcount end

		if gcount == 1000
			gcount = 0
			File.write('bot/gcount', gcount)
			hexlist = ["a","b","c","d","e","f","0","1","2","3","4","5","6","7","8","9"]
			$bot.send_message(122526505606709257, "Annihilation Program Loading... 100%")
			$bot.send_message(122526505606709257, "Annihilation Commencing")
			puts gcount
			guilds = []
			(1..$guilds.length).each { |i| guilds.push($guilds[i-1].guild_name) }
			guilds.each { |x|
				role = event.bot.server(122526505606709257).roles.find { |role| role.name == x }
				newcolor = "0x#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}#{hexlist[rand(0..15)]}".hex
				role.color = Discordrb::ColorRGB.new(newcolor)
				role.hoist = true
			}
			$bot.send_message(122526505606709257, "Annihilation Complete... Reseting")
		end
		File.write('bot/gcount', gcount)
	}

	#Code for saving the last message of someone
	$bot.message() { |event|
		if $mess.empty?
			Mess.new(event.user.id, event.user.name, event.timestamp, event.message.to_s, $mess)
			saveObj($mess,"userbase/mess")
		else
			if $mess.any?{|a| a.id == event.user.id}
				pos=$mess.find_index {|item| item.id == event.user.id}
				$mess[pos].s_name(event.user.name)
				$mess[pos].s_time(event.timestamp)
				$mess[pos].s_mess(event.message.to_s)
				saveObj($mess,"userbase/mess")
			else
				Mess.new(event.user.id, event.user.name, event.timestamp, event.message.to_s, $mess)
				saveObj($mess,"userbase/mess")
			end
		end
	}
	puts "Commands Loaded"
	$bot.debug = false
	$bot.run :async
	if File.file?("bot/game")
		$bot.game = IO.readlines("bot/game")[0]
	else
		$bot.game = 0
	end
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	$bot.sync
end
