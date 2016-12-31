module FelyneBot
	require_relative 'felynebot/extras/news'
	require_relative 'felynebot/extras/cron'
	#Pull $news from mho.qq.com and store to file
	news_pull
	
	#Create Global Variables
	$users = []
	$guilds = []
	$mess = []
	$wikilinks = ["armor", "cats", "crafting", "food", "gathering", "hunter-set", "hunter-set/#blademaster", "hunter-set/#gunner", "hunter-set/#list", "hunting-groups", "install", "jewelry", "materials", "monsters", "monsters/akura-jebia", "monsters/akura-vashimu", "monsters/azure-rathalos", "monsters/baelidae", "monsters/basarios", "monsters/blangonga", "monsters/blue-yian-kut-ku", "monsters/bulldrome", "monsters/burning-tartaronis", "monsters/caeserber", "monsters/cephadrome", "monsters/chameleos", "monsters/chramine", "monsters/conflagration-rathian", "monsters/congalala", "monsters/crystal-basarios", "monsters/daimyo-hermitaur", "monsters/diablos", "monsters/doom-estrellian", "monsters/dread-baelidae", "monsters/elemental-merphistophelin", "monsters/estrellian", "monsters/flame-blangonga", "monsters/gendrome", "monsters/ghost-caeserber", "monsters/giadrome", "monsters/gold-congalala", "monsters/gold-hypnocatrice", "monsters/gonngenn-hermitaur", "monsters/gravios", "monsters/guren-shen-gaoren", "monsters/gypceros", "monsters/hypnocatrice", "monsters/ice-chramine", "monsters/imag", "monsters/iodrome", "monsters/khezu", "monsters/kushala-daora", "monsters/lavasioth", "monsters/lightenna", "monsters/merphistophelin", "monsters/monoblos", "monsters/one-eared-yian-garuga", "monsters/pink-rathian", "monsters/plesioth", "monsters/purple-gypceros", "monsters/purple-slicemargl", "monsters/rajang", "monsters/rathalos", "monsters/rathian", "monsters/red-khezu", "monsters/sandstone-basarios", "monsters/shattered-monoblos", "monsters/shen-gaoren", "monsters/shogun-ceanataur", "monsters/silver-hypnocatrice", "monsters/slicemargl", "monsters/swordmaster-shogun-ceanataur", "monsters/tartaronis", "monsters/tepekki-shen-gaoren", "monsters/tigrex", "monsters/velocidrome", "monsters/white-monoblos", "monsters/yellow-caeserber", "monsters/yian-garuga", "monsters/yian-kut-ku", "mosaics", "npcs", "quests", "quests/#arena", "quests/#bounty", "quests/#elites", "quests/#monsters", "quests/#raids", "quests/#tickets", "quests/#unstable", "skills", "talismans", "talismans/table", "translation", "vip", "weapons", "weapons/bow", "weapons/bowgun", "weapons/dual-blades", "weapons/greatsword", "weapons/gunlance", "weapons/hammer", "weapons/hunting-horn", "weapons/lance", "weapons/longsword", "weapons/switch-axe", "weapons/sword-and-shield"]
	puts "Globals initialized!"
	
	#load files into Globals
	loadusers("userbase/users")
	loadmess("userbase/mess")
	loadguilds("userbase/guilds")
	Dotenv.load
	puts "All variables initialized!"

	#sets bot prefix
	$prefix = '-'

	#Loads and establishes $bot object
	$bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: ENV['CLIENT'], prefix: $prefix, advanced_functionality: false
	puts "$bot Loaded!"

	#Loads permissions from array
	permarray = []
	permarray = loadArr(permarray,"userbase/perm")
	pos = 0
	begin
		$bot.set_user_permission(permarray[pos],permarray[pos+1])
		pos += 3
	end while pos < permarray.length
	puts "Permission Loaded!"

	#Set up buckets
	$bot.bucket :delay10, delay: 1
	$bot.bucket :delay300, delay: 30
	puts "Buckets filled!"

	#Load all commands
	Commands.constants.each do |mod|
		$bot.include! Commands.const_get mod
	end

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
		event.respond "Im sorry Dave, Im afraid I can't do that."
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
		id_list = ["1112", "1113", "1114", "1115", "1116", "1117", "1118", "1119", "1110", "2111", "3111", "4111", "5111", "6111", "7111", "8111", "9111", "0111"]
		if id_list.any?{|s| event.message.content.include?(s)}
		else
			event.respond "CATCH THE FUCKING MONSTER!!"
		end
	}
	$bot.message(containing: "RIP") { |event|
		rip = ["Rest in Pizza", "RIP in Peace", "Ripperoni", "Rippy Dippy Doo", "Rest in Peace", "RIP in Pizza"]
		event.respond rip[rand(0..(rip.length-1))]
	}
	$bot.message(containing: ["english patch", "English Patch", "English patch", "english Patch", "Eng Patch", "Eng patch", "eng patch", "eng Patch", "ENGLISH PATCH", "ENG PATCH"]) { |event|
		engpatch = "2016-06-21 00:00:00 +0000"
		t1 = Time.now
		t4 = Time.parse(engpatch)
		d1 = TimeDifference.between(t1, t4).in_days
		d2 = d1.floor
		event.respond "Day #{d2}: Still no english patch"
	}
	puts "Commands Loaded"
	
	#Turn off debugging and run async
	$bot.debug = false
	$bot.run :async
		
	#Set game status from file
	if File.file?("bot/game")
		$bot.game = getline("bot/game",1)
	else
		$bot.game = 0
	end
	puts "Game set!"	

	
	today = Date::MONTHNAMES[Date.today.month]
	if today == "December"
		$bot.profile.avatar = File.open("pic/christmas.png")
		puts "It's December! Christmas Avatar loaded!"
	end
	
	#post news
	news_post

	#scedule cron jobs
	cronjobs_start
	
	puts 'Sync Confirmed!'
	puts 'SKYNET ONLINE'
	$bot.sync
end
