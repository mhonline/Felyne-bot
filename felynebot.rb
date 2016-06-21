module FelyneBot
	require_relative 'class/info'
	puts "Info Loaded"

	$users=[]
	loadusers("userbase/users")
	$guilds=[]
	loadusers("userbase/guilds")
	info=Info.new('bot/token','bot/id')
	token=info.token
	id=info.id

	$prefix = '-'

	$bot = Discordrb::Commands::CommandBot.new token: token, application_id: id, prefix: $prefix, advanced_functionality: false
	puts "BOT Loaded"

#Loads permissions from array
	permarray=[]
	permarray = loadArr(permarray,"userbase/perm")

#Loading permissions array
	pos=0
	begin
		$bot.set_user_permission(permarray[pos],permarray[pos+1])
		#puts "Added #{permarray[pos+2]} as level #{permarray[pos+1]} user"
		pos+=3
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

#Fun Commands
	$bot.message(containing: "(╯°□°）╯︵ ┻━┻") do |event|
		event << "┬─┬﻿ ノ( ゜-゜ノ)"
	end
	$bot.message(containing: "Open the pod bay doors") do |event|
		role = event.server.roles.find { |role| role.name == "Felyne" }
		newcolor = '0x'
		newcolor << IO.readlines("bot/colors")[0]
		newcolor=newcolor.gsub("\n","").hex
		role.color = Discordrb::ColorRGB.new(newcolor)
		$bot.profile.avatar = File.open("/Felyne-bot/pic/HAL9000.png")
		event << "Im sorry Dave, Im afraid I cant do that.'"
	end

	$bot.message(containing: "┬─┬﻿ ノ( ゜-゜ノ)") do |event|
		event << "(╯°□°）╯︵ ┻━┻"
	end

	puts "Commands Loaded"
	$bot.debug = false
	$bot.run :async
	$bot.game = IO.readlines("bot/game")[0]
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	$bot.sync
end
