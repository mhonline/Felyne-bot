module FelyneBot
	require_relative 'felynebot/class/info'
	puts "Info Loaded!"

	#Pull $news from mho.qq.com and store to file
	$currentnews = open('http://mho.qq.com/webplat/info/news_version3/5499/5500/5501/m4027/list_1.shtml').read
	$currentnews.gsub!(/.*?(?=<ul class="newsList">)/im, "")
	$currentnews.delete! "\s"
	File.write('bot/newnews', $currentnews)
	puts "news gathered!"
	
	#Create Global Variables
	$users = []
	$guilds = []
	$mess = []
	$wikilinks = ["armor", "cats", "crafting", "food", "gathering", "hunter-set", "hunter-set/#blademaster", "hunter-set/#gunner", "hunter-set/#list", "hunting-groups", "install", "jewelry", "materials", "monsters", "monsters/akura-jebia", "monsters/akura-vashimu", "monsters/azure-rathalos", "monsters/baelidae", "monsters/basarios", "monsters/blangonga", "monsters/blue-yian-kut-ku", "monsters/bulldrome", "monsters/burning-tartaronis", "monsters/caeserber", "monsters/cephadrome", "monsters/chameleos", "monsters/chramine", "monsters/conflagration-rathian", "monsters/congalala", "monsters/crystal-basarios", "monsters/daimyo-hermitaur", "monsters/diablos", "monsters/doom-estrellian", "monsters/dread-baelidae", "monsters/elemental-merphistophelin", "monsters/estrellian", "monsters/flame-blangonga", "monsters/gendrome", "monsters/ghost-caeserber", "monsters/giadrome", "monsters/gold-congalala", "monsters/gold-hypnocatrice", "monsters/gravios", "monsters/guren-shen-gaoren", "monsters/gypceros", "monsters/hypnocatrice", "monsters/ice-chramine", "monsters/imag", "monsters/iodrome", "monsters/khezu", "monsters/kushala-daora", "monsters/lavasioth", "monsters/lightenna", "monsters/merphistophelin", "monsters/monoblos", "monsters/one-eared-yian-garuga", "monsters/pink-rathian", "monsters/plesioth", "monsters/purple-gypceros", "monsters/purple-slicemargl", "monsters/rajang", "monsters/rathalos", "monsters/rathian", "monsters/red-khezu", "monsters/sandstone-basarios", "monsters/shattered-monoblos", "monsters/shen-gaoren", "monsters/shogun-ceanataur", "monsters/silver-hypnocatrice", "monsters/slicemargl", "monsters/swordmaster-shogun-ceanataur", "monsters/tartaronis", "monsters/tepekki-shen-gaoren", "monsters/tigrex", "monsters/velocidrome", "monsters/white-monoblos", "monsters/yellow-caeserber", "monsters/yian-garuga", "monsters/yian-kut-ku", "mosaics", "npcs", "quests", "quests/#arena", "quests/#bounty", "quests/#elites", "quests/#monsters", "quests/#raids", "quests/#tickets", "quests/#unstable", "skills", "talismans", "talismans/table", "translation", "vip", "weapons", "weapons/bow", "weapons/bowgun", "weapons/dual-blades", "weapons/greatsword", "weapons/gunlance", "weapons/hammer", "weapons/hunting-horn", "weapons/lance", "weapons/longsword", "weapons/sword-and-shield"]
	puts "Globals initialized!"
	
	#load files into Globals
	loadusers("userbase/users")
	loadmess("userbase/mess")
	loadguilds("userbase/guilds")
	info = Info.new('bot/token','bot/cid','bot/aid')
	token = info.token
	cid = info.cid
	aid = info.aid
	scheduler = Rufus::Scheduler.new
	puts "All variables initialized!"

	#sets bot prefix
	$prefix = '-'

	#Loads and establishes $bot object
	$bot = Discordrb::Commands::CommandBot.new token: token, client_id: 168427142126764033, prefix: $prefix, advanced_functionality: false
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
	$bot.bucket :delay10, delay: 10
	$bot.bucket :delay300, delay: 300
	puts "Buckets filled!"

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
	$bot.include! Commands::Achievement
	$bot.include! Commands::Ass
	$bot.include! Commands::Awaken
	$bot.include! Commands::Blog
	$bot.include! Commands::Bounty
	$bot.include! Commands::Cat
	$bot.include! Commands::CatQuest
	$bot.include! Commands::Catskill
	$bot.include! Commands::CatVids
	$bot.include! Commands::Coupon
	$bot.include! Commands::Damage
	$bot.include! Commands::Deco
	$bot.include! Commands::Helix
	$bot.include! Commands::Help
	$bot.include! Commands::HGE
	$bot.include! Commands::HS
	$bot.include! Commands::Maint
	$bot.include! Commands::Newbie
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
	#Other
	$bot.include! Commands::Ask
	$bot.include! Commands::Danger
	$bot.include! Commands::GuildWars
	$bot.include! Commands::Hosting
	$bot.include! Commands::Last
	$bot.include! Commands::Roll
	$bot.include! Commands::Remindme
		
	$news = getline("bot/oldnews",1).split(",")
	#news2
	$news2 = getline("bot/newnews",2)
	$news2 = $news2.chars.select(&:valid_encoding?).join
	$news2date = $news2[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news2link = $news2[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	#news3
	$news3 = getline("bot/newnews",3)
	$news3 = $news3.chars.select(&:valid_encoding?).join
	$news3date = $news3[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news3link = $news3[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	#news4
	$news4 = getline("bot/newnews",4)
	$news4 = $news4.chars.select(&:valid_encoding?).join
	$news4date = $news4[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news4link = $news4[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	#news5
	$news5 = getline("bot/newnews",5)
	$news5 = $news5.chars.select(&:valid_encoding?).join
	$news5date = $news5[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news5link = $news5[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]
	#news6
	$news6 = getline("bot/newnews",6)
	$news6 = $news6.chars.select(&:valid_encoding?).join
	$news6date = $news6[/#{"<li><span>"}(.*?)#{"</span>"}/m, 1]
	$news6link = $news6[/#{"a><ahref=\""}(.*?)#{"\"target"}/m, 1]

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
	
	#news6
	if !$news.include? $news6date + " | " + $news6link
		$news.push($news6date + " | " + $news6link)
		$bot.send_message(126766276038230016, "#{$news6date} | http://mho.qq.com#{$news6link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	#news5
	if !$news.include? $news5date + " | " + $news5link
		$news.push($news5date + " | " + $news5link)
		$bot.send_message(126766276038230016, "#{$news5date} | http://mho.qq.com#{$news5link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	#news4
	if !$news.include? $news4date + " | " + $news4link
		$news.push($news4date + " | " + $news4link)
		$bot.send_message(126766276038230016, "#{$news4date} | http://mho.qq.com#{$news4link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	#news3
	if !$news.include? $news3date + " | " + $news3link
		$news.push($news3date + " | " + $news3link)
		$bot.send_message(126766276038230016, "#{$news3date} | http://mho.qq.com#{$news3link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	#news2
	if !$news.include? $news2date + " | " + $news2link
		$news.push($news2date + " | " + $news2link)
		$bot.send_message(126766276038230016, "#{$news2date} | http://mho.qq.com#{$news2link}")
		$news1 = $news.join(",").gsub("\n","")
		File.write("bot/oldnews", $news1)
	end
	puts '$news Posted!'
	
	scheduler.cron '0 19 * * 1,2,3,5,6,7' do
		$bot.send_message(122526505606709257, "Daily gift/ticket reset just happened!\nDon't forget to collect your rewards!")
		$bot.send_message(125859373393117184, "Daily gift/ticket reset just happened!\nDon't forget to collect your rewards!")
		if File.file?("bot/dailypm")
			dailypm = loadArr(dailypm,"bot/dailypm")
		else
			dailypm = []
		end
		dailypm.each { |x| $bot.user(x).pm("Daily gift/ticket reset just happened!\nDon't forget to collect your rewards!")}
	end
	scheduler.cron '0 19 * * 4' do
		$bot.send_message(122526505606709257, "Weekly gift/ticket reset just happened!\nYour extra ticket storage has been refilled!\nAny weekly events such as Astrolab have been reset!\nDon't forget to collect your rewards!")
		$bot.send_message(125859373393117184, "Weekly gift/ticket reset just happened!\nYour extra ticket storage has been refilled!\nAny weekly events such as Astrolab have been reset!\nDon't forget to collect your rewards!")
		if File.file?("bot/dailypm")
			dailypm = loadArr(dailypm,"bot/dailypm")
		else
			dailypm = []
		end
		dailypm.each { |x| $bot.user(x).pm("Weekly gift/ticket reset just happened!\nYour extra ticket storage has been refilled!\nAny weekly events such as Astrolab have been reset!\nDon't forget to collect your rewards!")}
	end
	scheduler.cron '0 11 * * 6' do
		$bot.send_message(122526505606709257, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		$bot.send_message(125859373393117184, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		if File.file?("bot/weekendpm")
			weekendpm = loadArr(weekendpm,"bot/weekendpm")
		else
			weekendpm = []
		end
		weekendpm.each { |x| $bot.user(x).pm("Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")}
	end
	scheduler.cron '0 11 * * 7' do
		$bot.send_message(122526505606709257, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		$bot.send_message(125859373393117184, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		if File.file?("bot/weekendpm")
			weekendpm = loadArr(weekendpm,"bot/weekendpm")
		else
			weekendpm = []
		end
		weekendpm.each { |x| $bot.user(x).pm("Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")}
	end
	scheduler.cron '5 */3 * * *' do
		$bot.stop
	end
	puts 'Cron jobs scheduled!'
	
	puts 'Sync Confirmed!'
	puts 'SKYNET ONLINE'
	$bot.sync
end
