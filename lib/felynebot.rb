module FelyneBot
	require_relative 'felynebot/class/info'
	puts "Info Loaded"

#	$mess = []
	$users = []
	$guilds = []
	loadusers("userbase/users")
	loadmess("userbase/mess")
	loadguilds("userbase/guilds")
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
	$bot.include! Commands::BotMod
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
	$bot.include! Commands::Ass
	$bot.include! Commands::Awaken
	$bot.include! Commands::Blog
	$bot.include! Commands::Bounty
	$bot.include! Commands::CatQuest
	$bot.include! Commands::CatVids
	$bot.include! Commands::Coupon
	$bot.include! Commands::Damage
	$bot.include! Commands::Deco
	$bot.include! Commands::Helix
	$bot.include! Commands::Help
	$bot.include! Commands::HGE
	$bot.include! Commands::HS
	$bot.include! Commands::Maint
	$bot.include! Commands::Ports
	$bot.include! Commands::Reset
	$bot.include! Commands::Sasha
	$bot.include! Commands::Server
	$bot.include! Commands::Server47
	$bot.include! Commands::SetBuild
	$bot.include! Commands::Sets
	$bot.include! Commands::Shell
	$bot.include! Commands::Stars
	$bot.include! Commands::Talents
	$bot.include! Commands::Unstable
	$bot.include! Commands::Wiki
#Mod only
	$bot.include! Commands::Announce
	$bot.include! Commands::Avatar
	$bot.include! Commands::Game
	$bot.include! Commands::MainSetup
	$bot.include! Commands::NewGuild
	$bot.include! Commands::RolePlay
#Raids
	$bot.include! Commands::Raid
	$bot.include! Commands::Raid1
	$bot.include! Commands::Raid2
	$bot.include! Commands::Raid3
	$bot.include! Commands::Raid4
	$bot.include! Commands::Raid5
#User Role
	$bot.include! Commands::UserRaid
#Other <not in fullhelp>
	$bot.include! Commands::Ask
	$bot.include! Commands::Danger
	$bot.include! Commands::GuildWars
	$bot.include! Commands::Roll
	$bot.include! Commands::Last

#Fun Commands
	$bot.message(containing: "(╯°□°）╯︵ ┻━┻") { |event|
		event.respond "┬─┬﻿ ノ( ゜-゜ノ)"
	}
	$bot.message(containing: "Open the pod bay doors") { |event|
		role = event.bot.server(122526505606709257).roles.find { |role| role.name == "Felyne" }
		newcolor = '0x'
		newcolor << getline("bot/colors",1)
		newcolor = newcolor.gsub("\n","").hex
		role.color = Discordrb::ColorRGB.new(newcolor)
		$bot.profile.avatar = File.open("pic/HAL9000.png")
		event.respond "Im sorry Dave, Im afraid I cant do that."
	}
	$bot.message(containing: "This fucking guy") { |event|
		role = event.bot.server(122526505606709257).roles.find { |role| role.name == "Felyne" }
		newcolor = '0x'
		newcolor << getline("bot/colors",1)
		newcolor = newcolor.gsub("\n","").hex
		role.color = Discordrb::ColorRGB.new(newcolor)
		$bot.profile.avatar = File.open("pic/mhol_christmas2.jpg")
		event.respond "This fucking guy indeed."
	}
	$bot.message(containing: "┬─┬﻿ ノ( ゜-゜ノ)") { |event|
		event.respond "(╯°□°）╯︵ ┻━┻"
	}
	$bot.message(containing: "111") { |event|
		if ["190211199097503745", "177511625111109632"].include? event.message.content
			
		else
			event.respond "CATCH THE FUCKING MONSTER!!"
		end
	}
	$bot.message { |event|
		if(event.channel.id == 127308098372108288)
			$bot.send_message(138344202005250049, "\##{event.message.channel.name} - #{event.user.name}: #{event.message.content.gsub(/<@!?(\d+)>/){ |m| event.server.member($1, false).name }}")
		end
	}
	$bot.message { |event|
		if(event.channel.id == 138344202005250049)
			$bot.send_message(127308098372108288, "\##{event.message.channel.name} - #{event.user.name}: #{event.message.content.gsub(/<@!?(\d+)>/){ |m| event.server.member($1, false).name }}")
		end
	}
#mho-discussion: 125859373393117184
#website: 197762918337478656
#betabot: 189667083586502656

	puts "Commands Loaded"
	$bot.debug = false
	$bot.run :async
	if File.file?("bot/game")
		$bot.game = getline("bot/game",1)
	else
		$bot.game = 0
	end
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	$bot.sync
end
