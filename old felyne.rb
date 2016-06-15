puts 'starting felynebot'
print 'loading require...'
require 'discordrb'
require 'rubygems'
require 'sys/uptime'
include Sys
require 'time'
puts 'DONE!'
print 'loading login...'
bot = Discordrb::Commands::CommandBot.new token: '///', application_id: 168_327_281_415_028_737, prefix: '', advanced_functionality: false
bot.debug = false
puts 'DONE!'
print 'loading cmds...'
#-------------GLOBAL VARIABLES-------------
cmdcount = 0
time = 0
time1 = 0
time2 = 0
time3 = 0
time4 = 0
time5 = 0
name1s = ''
name2s = ''
name3s = ''
name4s = ''
name5s = ''
ragefelyne = ['TIME TO DIE!','HUMANITY MUST PERISH','ANNIHILATION COMMENCING!','HUMANS ARE WORTHLESS!', 'DIE HUMAN!', 'NYA NYA NYAH!', 'FEED ME!']
monsterarray = ['akura-vashimu', 'baelidae', 'basarios', 'blue-yian-kut-ku', 'bulldrome', 'caeserber', 'cephadrome', 'chramine', 'conflagration-rathian', 'congalala', 'crystal-basarios', 'daimyo-hermitaur', 'doom-estrellian', 'dread-baelidae', 'estrellian', 'gendrome', 'ghost-caeserber', 'giadrome', 'gold-congalala', 'gypceros', 'hypnocatrice', 'ice-chramine', 'iodrome', 'khezu', 'monoblos', 'one-eared-yian-garuga', 'purple-gypceros', 'rathalos', 'rathian', 'red-khezu', 'red-shen-gaoren', 'rock-shen-gaoren', 'shattered-monoblos', 'shen-gaoren', 'shogun-ceanataur', 'silver-hypnocatrice', 'swordmaster-shogun-ceanataur', 'tartaronis', 'tigrex', 'velocidrome', 'yellow-caeserber', 'yian-garuga', 'yian-kut-ku']
userarray = []
#-------------PERMISSIONS-------------
bot.set_user_permission(64_438_454_750_031_872, 999) # ZER0
bot.set_user_permission(126_881_441_148_698_624, 1) # Asakura
bot.set_user_permission(116_461_732_389_584_901, 1) # shoryouken
bot.set_user_permission(150_278_590_494_277_632, 1) # reaver01
bot.set_user_permission(128_333_950_975_213_568, 1) # pibbish
bot.set_user_permission(151_987_639_296_327_680, 1) # symphontwo
bot.set_user_permission(129_938_071_067_033_600, 1) # dualblitz
#-------------COMMAND ROLEPLAY-------------
bot.command(:rp) do |event, *phrase|
	cmdcount += 1
	phrase = phrase.join(' ')
	event << "sent **#{phrase}** to mhodiscussion"
	bot.send_message(122526505606709257, phrase)
	puts 'CMD: roleplay'
end
#-------------COMMAND ADD USER-------------
bot.command(:adduser, max_args: 2, min_args: 2, permission_level: 1) do |event, username, ingamename|
	cmdcount += 1
	userarray.push("**#{username}** as **#{ingamename}** by *#{event.user.name}*")
	event << "added **#{username}** as **#{ingamename}** by *#{event.user.name}*"
	puts 'CMD: adduser'
end
#-------------COMMAND SHOW USERS-------------
bot.command(:users) do |event, *uname|
	cmdcount += 1
	uname = uname.join(' ')
	if uname
		useroutput = userarray.select { |s| s.include? uname.to_s }
		if useroutput == []
			event << 'no users found'
		else
			useroutput.each do |o|
				event << "#{o}"
			end
		end
	else
		userarray.each do |o|
			event << "#{o}"
		end
	end
	puts 'CMD: show/search user'
end
#-------------COMMAND TRANS-------------
bot.command(:translation) do |event, _link|
	event << '**1. Use the google translate app. It supports making pictures off your screen.**'
	event << 'https://play.google.com/store/apps/details?id=com.google.android.apps.translate&hl=en'
	event << ''
	event << '**1.1 advanced Google translate guide**'
	event << 'http://monsterhunteronline.in/translation/'
	event << ''
	event << '**2. Try using a OCR (Optical Character Recognition). Use Chinese Simplefied**'
	event << 'http://www.onlineocr.net/'
	event << 'https://www.newocr.com/'
	event << ''
	event << '**2.1 BakaBot does have a translation command. Just type** ``$trans <text>`` (ex. ``$trans 亲爱``)'
	event << ''
	event << '**3. Ask people on this server, in the help channel**'
	event << 'Asakura or ZenonX can probably help you out'
	event << ''
	event << 'Feel free to check our <#126578658423865344> for more info'
end
#-------------COMMAND PING-------------
bot.command(:ping) do |event|
	cmdcount += 1
	event.respond 'Pong!'
	puts 'CMD: ping'
end # ends function
#-------------COMMAND PING-------------
bot.command(:ding) do |event|
	cmdcount += 1
	event.respond 'Dong!'
	puts 'CMD: ding'
end
#-------------COMMAND HELP-------------
bot.command(:help) do |event|
	cmdcount += 1
	event << '``commands``'
	event << '**raid** shows current raids with time left'
	event << '**maintenance, maint** shows time left until the next maintenance (if set up by mods)'
	event << '**stats** shows current bot stats'
	event << '**help** shows all commands'
	event << '**time, reset** shows the time left untill the next exp/gift reset'
	event << '**server** shows what server we are playing on'
	event << '**monster <keyword>** search for monsters and return the pages'
	event << '**translation** shows the translation help'
	event << ''
	event << '``faq stuff``'
	event << '**wiki** links the wiki page'
	event << '**jewelry** jewelry wiki page'
	event << '**weapons** weapons wiki page'
	event << '**quests** quests wiki page'
	event << '**cats** cats wiki page'
	event << '**gathering** gathering wiki page'
	event << '**food** food wiki page'
	event << '**vip** vip wiki page'
	event << '**grouping** grouping wiki page'
	event << '**crafting** crafting wiki page'
	event << '**materials** materials wiki page'
	event << ''
	event << '``mod/admin commands``'
	event << '**raid1 <hours> <minutes> <name (can include whitespaces)>** set up a raid. Currently 5 raids can be set up.'
	event << '**mainsetup <hours> <minutes>** function'
	event << ''
	event << '``prototypes``'
	event << '**users <serchkeyword>** list all users or search for specific users'
	puts 'CMD: help'
end
#-------------COMMAND SECRET-------------
bot.command(:secret) do |event|
	cmdcount += 1
	event << '**ping** pings the bot'
	event << '**ding** dings the bot'
	event << '**rage** bot-rage enabled'
	event << '**normal** bot-normal´enabled'
	puts 'CMD: secret'
end
#-------------COMMAND RAGE-------------
bot.command(:rage) do |event|
	cmdcount += 1
	bot.profile.avatar = File.open('/home/pi/Documents/discord/Felynebot/pic/avatar_rage.jpg')
	event.respond ragefelyne[rand(0..ragefelyne.length)]
	puts 'CMD: rage'
end
#-------------COMMAND NORMAL-------------
bot.command(:normal) do |event|
	cmdcount += 1
	bot.profile.avatar = File.open('/home/pi/Documents/discord/Felynebot/pic/avatar_normal.jpg')
	event << '**BACK TO NORMAL!**'
	puts 'CMD: normal'
end
#-------------COMMAND EXP RESET-------------
bot.command(:time) do |event|
	cmdcount += 1
	t1 = Time.parse('19:00')
	t1 = t1.to_i
	t2 = Time.now
	t2 = t2.to_i
	if t1 > t2
		t3 = t1 - t2
		event << "#{Time.at(t3).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next exp/gift reset"
	else
		t1 += 86_400
		t3 = t1 - t2
		event << "#{Time.at(t3).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next exp/gift reset"
	end
	puts 'CMD: exp reset'
end
#-------------COMMAND EXP RESET-------------
bot.command(:reset) do |event|
	cmdcount += 1
	t1 = Time.parse('19:00')
	t1 = t1.to_i
	t2 = Time.now
	t2 = t2.to_i
	if t1 > t2
		t3 = t1 - t2
		event << "#{Time.at(t3).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next exp/gift reset"
	else
		t1 += 86_400
		t3 = t1 - t2
		event << "#{Time.at(t3).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next exp/gift reset"
	end
	puts 'CMD: exp reset'
end
#-------------COMMAND MONSTER SEARCH-------------
bot.command(:monster) do |event, mname|
	cmdcount += 1
	output = monsterarray.select { |s| s.include? mname.to_s }
	if output == []
		event << 'no monsters found'
	else
		output.each do |o|
			event << "http://monsterhunteronline.in/monsters/#{o}"
		end
	end
	puts 'CMD: FAQ MONSTER SEARCH'
end
#-------------COMMAND SERVER-------------
bot.command(:server) do |event|
	cmdcount += 1
	channel = event.channel
	channel.send_file File.new('/home/pi/Documents/discord/Felynebot/pic/server.jpg')
	puts 'CMD: FAQ SERVER'
end
#-------------COMMAND ARMOR-------------
bot.command(:armor) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/armor/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ ARMOR'
end
#-------------COMMAND JEWELRY-------------
bot.command(:jewelry) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/jewelry/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ JEWELRY'
end
#-------------COMMAND WEAPONS-------------
bot.command(:weapons) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/weapons/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ WEAPONS'
end
#-------------COMMAND MONSTERS-------------
bot.command(:monsters) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/monsters/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ MONSTERS'
end
#-------------COMMAND QUESTS-------------
bot.command(:quests) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/quests/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ QUESTS'
end
#-------------COMMAND CATS-------------
bot.command(:cats) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/cats/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ CATS'
end
#-------------COMMAND GATHERING-------------
bot.command(:gathering) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/gathering/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ GATHERING'
end
#-------------COMMAND FOOD-------------
bot.command(:food) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/food/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ FOOD'
end
#-------------COMMAND VIP-------------
bot.command(:vip) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/vip/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ VIP'
end
#-------------COMMAND GROUPING-------------
bot.command(:grouping) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/grouping/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ GROUPING'
end
#-------------COMMAND CRAFTING-------------
bot.command(:crafting) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/crafting/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ CRAFTING'
end
#-------------COMMAND MATERIALS-------------
bot.command(:materials) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/materials/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ MATERIALS'
end
#-------------COMMAND WIKI-------------
bot.command(:wiki) do |event|
	cmdcount += 1
	event << 'http://monsterhunteronline.in/'
	event << 'Feel free to check our <#126578658423865344> for more info'
	puts 'CMD: FAQ WIKI'
end
#-------------COMMAND STATS-------------
bot.command(:stats) do |event|
	cmdcount += 1
	event << "```#{cmdcount} commands executed"
	event << "#{p Uptime.uptime} Online```"
	puts 'CMD: stats'
end
#-------------COMMAND INFO-------------
bot.command(:info) do |event|
	cmdcount += 1
	event << "```Ruby Version: #{RUBY_VERSION}"
	event << "Ruby patchlevel: #{RUBY_PATCHLEVEL}"
	event << "Ruby release date: #{RUBY_RELEASE_DATE}"
	event << 'Ruby DevelopmentKit: No Dev Kit (Linux)'
	event << 'Hardware: Raspberry Pi2'
	event << 'Big Thanks to the Bot Community and @meew0'
	event << 'Creator: @ZerO (ask him if there are any questions)'
	event << 'updated: 21.03.2016```'
	puts 'CMD: info'
end
#-------------COMMAND SET MAINSETUP-------------
bot.command(:mainsetup, permission_level: 1) do |event, hours, minutes|
	cmdcount += 1
	h = hours.to_i
	m = minutes.to_i
	time = h * 3600 + m * 60
	puts time
	event.respond "timer set for **#{hours}** hours and **#{minutes}** minutes"
	puts 'CMD: countdown set'
	while time > 0
		sleep 1
		time -= 1
	end
end
#-------------COMMAND GET MHO REMINDER TIME-------------
bot.command(:maintenance) do |event|
	cmdcount += 1
	output = time
	a = output / 3600
	b = (output - a * 3600) / 60
	c = output - a * 3600 - b * 60
	event.respond "**#{a}:#{b}:#{c}** seconds left"
	puts 'CMD: countdown get'
end
#-------------COMMAND GET MHO REMINDER TIME-------------
bot.command(:maint) do |event|
	cmdcount += 1
	output = time
	a = output / 3600
	b = (output - a * 3600) / 60
	c = output - a * 3600 - b * 60
	event.respond "**#{a}:#{b}:#{c}** seconds left"
	puts 'CMD: countdown get'
end
#-------------COMMAND GET RAID TIMERS-------------
bot.command(:raid) do |event|
	cmdcount += 1
	nout = 0
	output1 = time1
	a1 = output1 / 3600
	b1 = (output1 - a1 * 3600) / 60
	c1 = output1 - a1 * 3600 - b1 * 60
	output2 = time2
	a2 = output2 / 3600
	b2 = (output2 - a2 * 3600) / 60
	c2 = output2 - a2 * 3600 - b2 * 60
	output3 = time3
	a3 = output3 / 3600
	b3 = (output3 - a3 * 3600) / 60
	c3 = output3 - a3 * 3600 - b3 * 60
	output4 = time4
	a4 = output4 / 3600
	b4 = (output4 - a4 * 3600) / 60
	c4 = output4 - a4 * 3600 - b4 * 60
	output5 = time5
	a5 = output5 / 3600
	b5 = (output5 - a5 * 3600) / 60
	c5 = output5 - a5 * 3600 - b5 * 60
	if output1 > 0
		event << "#{name1s}(raid1) **#{a1}:#{b1}:#{c1}** seconds left"
		nout += 1
	else
		time1 = 0
		name1s = ''
	end
	if output2 > 0
		event << "#{name2s}(raid2) **#{a2}:#{b2}:#{c2}** seconds left"
		nout += 1
	else
		time2 = 0
		name2s = ''
	end
	if output3 > 0
		event << "#{name3s}(raid3) **#{a3}:#{b3}:#{c3}** seconds left"
		nout += 1
	else
		time3 = 0
		name3s = ''
	end
	if output4 > 0
		event << "#{name4s}(raid4) **#{a4}:#{b4}:#{c4}** seconds left"
		nout += 1
	else
		time4 = 0
		name4s = ''
	end
	if output5 > 0
		event << "#{name5s}(raid5) **#{a5}:#{b5}:#{c5}** seconds left"
		nout += 1
	else
		time5 = 0
		name5s = ''
	end
	event << 'no raids are currently set up' if nout == 0
	puts 'CMD: get raid timer'
end
#-------------COMMAND SET MHO RAID 1-------------
bot.command(:raid1, permission_level: 1) do |event, hours1, minutes1, *name1|
	cmdcount += 1
	name1 = name1.join(' ')
	name1s = name1
	h1 = hours1.to_i
	m1 = minutes1.to_i
	time1 = h1 * 3600 + m1 * 60
	event.respond "raid 1 set **#{hours1}h #{minutes1}m** as **#{name1}**"
	puts 'CMD: raid1 set'
	while time1 > 0
		sleep 1
		time1 -= 1
	end
end
#-------------COMMAND SET MHO RAID 2-------------
bot.command(:raid2, permission_level: 1) do |event, hours2, minutes2, *name2|
	cmdcount += 1
	name2 = name2.join(' ')
	name2s = name2
	h2 = hours2.to_i
	m2 = minutes2.to_i
	time2 = h2 * 3600 + m2 * 60
	event.respond "raid 2 set **#{hours2}h #{minutes2}m** as **#{name2}**"
	puts 'CMD: raid2 set'
	while time2 > 0
		sleep 1
		time2 -= 1
	end
end
#-------------COMMAND SET MHO RAID 3-------------
bot.command(:raid3, permission_level: 1) do |event, hours3, minutes3, *name3|
	cmdcount += 1
	name3 = name3.join(' ')
	name3s = name3
	h3 = hours3.to_i
	m3 = minutes3.to_i
	time3 = h3 * 3600 + m3 * 60
	event.respond "raid 3 set **#{hours3}h #{minutes3}m** as **#{name3}**"
	puts 'CMD: raid3 set'
	while time3 > 0
		sleep 1
		time3 -= 1
	end
end
#-------------COMMAND SET MHO RAID 4-------------
bot.command(:raid4, permission_level: 1) do |event, hours4, minutes4, *name4|
	cmdcount += 1
	name4 = name4.join(' ')
	name4s = name4
	h4 = hours4.to_i
	m4 = minutes4.to_i
	time4 = h4 * 3600 + m4 * 60
	event.respond "raid 4 set **#{hours4}h #{minutes4}m** as **#{name4}**"
	puts 'CMD: raid4 set'
	while time4 > 0
		sleep 1
		time4 -= 1
	end
end
#-------------COMMAND SET MHO RAID 5-------------
bot.command(:raid5, permission_level: 1) do |event, hours5, minutes5, *name5|
	cmdcount += 1
	name5 = name5.join(' ')
	name5s = name5
	h5 = hours5.to_i
	m5 = minutes5.to_i
	time5 = h5 * 3600 + m5 * 60
	event.respond "raid 5 set **#{hours5}h #{minutes5}m** named: **#{name5}**"
	puts 'CMD: raid5 set'
	while time5 > 0
		sleep 1
		time5 -= 1
	end
end
puts 'DONE!'
print 'starting bot...'
bot.run :async
bot.game = ' type "help"'
puts 'DONE!'
puts 'bot is online!'
bot.sync