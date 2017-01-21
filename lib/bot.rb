#create botfiles directory if it doesn't exist
unless File.exist?("botfiles")
	Dir.mkdir("botfiles")
end

#pull news from mho.qq.com
unless File.file?("botfiles/oldnews")
	File.write('botfiles/oldnews', "item1,item2")
end
news_pull

#load env variables
Dotenv.load

#load other variables
$raids = Hash.new
$raids = loadJSON($raids, "botfiles/raids.json")
$qqnews = Hash.new
$qqnews = loadJSON($qqnews, "botfiles/qqnews.json")
$daily = Hash.new
$daily = loadJSON($daily, "botfiles/daily.json")
$info = Hash.new
$info = loadJSON($info, "botfiles/info.json")
loadusers("botfiles/users")
loadguilds("botfiles/guilds")

#sets bot prefix
$prefix = '-'

#Loads and establishes $bot object
$bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: ENV['CLIENT'], prefix: $prefix, advanced_functionality: false

#Load permissions from file
permarray = Array.new
permarray = loadPerm(permarray,"botfiles/perm")
pos = 0
begin
	$bot.set_user_permission(permarray[pos],permarray[pos+1])
	pos += 3
end while pos < permarray.length
puts "Permission Loaded!"

#Load all commands
Commands.constants.each do |x|
	$bot.include! Commands.const_get x
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
$bot.message(containing: ["Aslind", "aslind", "Asslind", "asslind"]) { |event|
	engpatch = "2016-12-27 00:00:00 +0000"
	t1 = Time.now
	t4 = Time.parse(engpatch)
	d1 = TimeDifference.between(t1, t4).in_days
	d2 = d1.floor
	event.respond "Day #{d2}: Still no Aslind"
}
puts "Commands Loaded"

#Turn off debugging and run async
$bot.debug = false
$bot.run :async
	
#Set game status from file
if $info.has_key?('game')
	$bot.game = $info['game']
else
	$bot.game = 0
end

#post news
news_post

#start cron
cronjobs_start

puts 'SKYNET ONLINE'
$bot.sync
