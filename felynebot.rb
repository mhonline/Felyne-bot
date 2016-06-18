module FelyneBot
	require_relative 'class/info'
	puts "Loaded info"

	$users=[]
	loadusers("userbase/users")
	info=Info.new('bot/token','bot/id')
	token=info.token
	id=info.id

	$bot = Discordrb::Commands::CommandBot.new token: token, application_id: id, prefix: '-', advanced_functionality: false
	puts "Bot begun"

#Loads permissions from array
	puts 'Permessions Loading!'
	permarray=[]
	permarray = loadArr(permarray,"userbase/perm")

#Loading permissions array
	pos=0
	begin
		$bot.set_user_permission(permarray[pos],permarray[pos+1])
		#puts "Added #{permarray[pos+2]} as level #{permarray[pos+1]} user"
		pos+=3
	end while pos < permarray.length
	puts "------------->Permission Loaded!"

#Admin/Troubleshooting
	$bot.include! Commands::Ping
	$bot.include! Commands::Kill
#IGN/Guild/Timezone Database
	$bot.include! Commands::AddUser
	$bot.include! Commands::UserIgn
	$bot.include! Commands::UserGuild
	$bot.include! Commands::UserTimezone
	$bot.include! Commands::UserRemove
	$bot.include! Commands::UserList
	$bot.include! Commands::UserFind
#Helpful Commands
	$bot.include! Commands::Reset
	$bot.include! Commands::Server
	$bot.include! Commands::Maint
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
#Mod only
	$bot.include! Commands::MainSetup
	$bot.include! Commands::RolePlay
	$bot.include! Commands::Color
	$bot.include! Commands::Game

#Fun Commands
	$bot.message(containing: "(╯°□°）╯︵ ┻━┻") do |event|
		event << "┬─┬﻿ ノ( ゜-゜ノ)"
	end
	$bot.message(containing: "Open the pod bay doors") do |event|
		event << "Im sorry Dave, Im afraid I cant do that.'"
		$bot.profile.avatar = File.open("/Felyne-bot/pic/HAL9000.png")
	end

	$bot.message(containing: "┬─┬﻿ ノ( ゜-゜ノ)") do |event|
		event << "(╯°□°）╯︵ ┻━┻"
	end

	puts "Commands Loaded"
	$bot.debug = false
	$bot.run :async
	$bot.game = '-help'
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	$bot.sync
end
