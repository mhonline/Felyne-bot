module FelyneBot
	puts 'starting felynebot'
	print 'loading require...'
	require 'json'
	require 'discordrb'
	require 'rubygems'
	require 'sys/uptime'
	require 'active_support'
	require 'yaml'
	include Sys
	require 'time'

	require_relative 'other/store_data'
	require_relative 'commands/ping'

	clock=Time.new

	puts "Starting at: "+clock.inspect
	puts 'DONE!'
	puts 'loading login...'

	#Simple prompt for input
	def prompt(*args)
	    print(*args)
	    gets
	end


	class User
	  def initialize(id, name, ign, array, channel, b)
	    @usr_id=id
	    @usr_name=name
	    @usr_ign=ign
	    @usr_guild=nil
	    @user_timezone=nil

	    if array.empty?
	      array.push(self)
	      b.send_message(channel, "**#{name}** not found in (empty) database, added. IGN: **#{ign}**")
	    else
	      if array.any?{|a| a.id == id}
	        b.send_message(channel, "**#{name}** found in database, skipped.")
	      else
	        array.push(self)
	        b.send_message(channel, "**#{name}** not found in database, added. IGN: **#{ign}**")
	      end
	    end
	  end

	  def addName(name="")
	    @usr_name=name
	  end

	  def addIgn(ign="")
	    @usr_ign=ign
	  end

	  def addGuild(guild=nil)
	    @usr_guild=guild
	  end

	  def addTimezone(zone=nil)
	    @usr_timezone=zone
	  end

	  #Defining the user id variable (call it with user.id)
	  def id
	    @usr_id
	  end
	  #Defining the user name variable (call it with user.name)
	  def name
	    @usr_name
	  end
	  #Defining the user ign variable (call it with user.ign)
	  def ign
	    @usr_ign
	  end
	  #Defining the user guild variable (call it with user.guild)
	  def guild
	    @usr_guild
	  end
	  #Defining the user id variable (call it with user.timezone)
	  def timezone
	    @usr_timezone
	  end
	end

	#Creating the actual user array/loads the file there
	users=[]
	if File.exist?("userbase/users")
	  f = File.open("userbase/users","r")
	  users=YAML.load(f)
	  puts 'Loaded user database'
	  f.close
	else
	  puts 'No file to open!'
	end


	#Open file for token/Get Token
	if File.exist?("bot/token")
		puts 'Opened file'
		f = File.open("bot/token","r")
		token = f.read
		f.close
	else
		puts 'No file found for the Token String! Please input your token.'
		token = prompt "Token: "

		q= prompt "Store this for next time? y/n: "
		if q[0] == "y"
			if File.exist?("bot/token")
					f = File.open("bot/token","w")
			else
					puts 'Creating new file [bot/token]'
					f = File.new("bot/token","w")
			end
			f.write(token)
			f.close
		end
	end

	puts '------->Token Loaded!'

	#Open file for ID/Get ID
	if File.exist?("bot/id")
		puts 'Opened file'
		f = File.open("bot/id","r")
		id = f.read
		f.close
	else
		puts 'No file found for the ID String! Please input the ID.'
		id = prompt "Client/Application ID: "

		q= prompt "Store this for next time? y/n: "
		if q[0] == "y"
			if File.exist?("bot/id")
					f = File.open("bot/id","w")
			else
					puts 'Creating new file [bot/id]'
					f = File.new("bot/id","w")
			end
			f.write(id)
			f.close
		end
	end

	puts '------->ID Loaded!'





	#Create the bot object
	BOT = Discordrb::Commands::CommandBot.new(token: token,
											  application_id: id,
											  prefix: '-',
											  advanced_functionality: false)

	BOT.include! Commands::Ping

	BOT.debug = false
	puts 'Bot Created!'

	#Loads permissions from array
	puts 'Permessions Loading!'
	permarray=[]
	permarray = load_arr(permarray,"userbase/perm")

	#Loading permissions array
	pos=0
	begin
		BOT.set_user_permission(permarray[pos],permarray[pos+1])
		puts "Added #{permarray[pos+2]} as level #{permarray[pos+1]} user"
		pos+=3
	end while pos < permarray.length
	puts "------------->Permission Loaded!"


	#Add a user to the database (Now with objects!)
	BOT.command(:adduser,min_args: 1, max_args: 1, description: "Adds a user the the database. -adduser <IGN>", usage: "-adduser <IGN>") do |event, ign|
	  puts "#{clock.inspect}: #{event.user.name}: -adduser <#{ign}>"
	  tempUser= User.new(event.user.id, event.user.name, ign, users, event.message.channel, bot)
	  saveObj(users,"userbase/users")
	  puts "Command worked"
	end
	#Show user database
	BOT.command(:userlist, min_args: 0, max_args: 1, description: "Shows the user database.") do |event, page=1|

	  page=page.to_i-1
	  if page<0 then page=0 end
	  if users.length == 0 then event << "User table is empty!"
	  else
	    pages=users.length/9
	    if pages<1 then pages=1 end
	    if page>=pages then page=0 end
	    i=(users.length/pages)*page
	    event << "User Database:"
	    event << "```Name                IGN                 Guild               Timezone"
	      begin
	        str = ""
	        if users[i].name!=nil then str << "#{users[i].name.to_s}" end
	        str=str.ljust(20)
	        if users[i].ign!=nil then str << "#{users[i].ign.to_s}" end
	        str=str.ljust(40)
	        if users[i].guild!=nil then str << "#{users[i].guild.to_s}" end
	        str=str.ljust(60)
	        if users[i].timezone!=nil then str << "#{users[i].timezone.to_s}" end
	        #if users[i].name!=nil then str << "```" end
	        event << str
	        i+=1
	      end while i < (users.length/pages)*(page+1)
	      event << "```"
	      event << "Showing page #{page+1}/#{pages}"
	    end
	    puts "#{clock.inspect}: #{event.user.name}: -userlist <#{page}>"
	end

	#Find users in the database.
	BOT.command(:userfind, min_args: 1, max_args: 1) do |event, search|
	  i=0
	  found=[]
	  begin
	    if users[i].id!=nil && users[i].id==search then found.push(users[i]) end
	    if users[i].name!=nil && users[i].name.downcase.include?(search.downcase) then found.push(users[i]) end
	    if users[i].ign!=nil && users[i].ign.downcase.include?(search.downcase) then found.push(users[i]) end
	    if users[i].guild!=nil && users[i].guild.downcase.include?(search.downcase) then found.push(users[i]) end
	    if users[i].timezone!=nil && users[i].timezone.downcase.include?(search.downcase) then found.push(users[i]) end
	    i+=1
	  end while users[i]!=nil
	  found.uniq!
	  if !found.empty?
	    i=0
	    event << "Found User Database:"
	    event << "```Name                IGN                 Guild               Timezone"
	      begin
	        str = ""
	        if found[i].name!=nil then str << "#{found[i].name.to_s}" end
	        str=str.ljust(20)
	        if found[i].ign!=nil then str << "#{found[i].ign.to_s}" end
	        str=str.ljust(40)
	        if found[i].guild!=nil then str << "#{found[i].guild.to_s}" end
	        str=str.ljust(60)
	        if found[i].timezone!=nil then str << "#{found[i].timezone.to_s}" end
	        event << str
	        i+=1
	      end while i < found.length
	      event << "```"
	  end
	end
	#Time to reset
	BOT.command(:time) do |event|
	  t2 = Time.now.to_i
	  t1 = Time.parse("20:00").to_i
	  if t1 > t2 then event << "#{Time.at(t1 - t2).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next ticket reset"
	  else event << "#{Time.at(t1 + 86400 - t2).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next ticket reset" end
	  puts "#{clock.inspect}: #{event.user.name}: -time"
	end
	#Load userdatabase
	BOT.command(:load, description: "Loads user array file.", usage: "-load", permission_level: 100) do |event|
		if File.exist?("userbase/users") then f = File.open("userbase/users","r") end
		users=YAML.load(f)
		puts 'Loaded user database'
	  f.close
	end
	#save user database
	BOT.command(:save, description: "Saves user array to file.", usage: "-save", permission_level: 100) do |event|
		if File.exist?("userbase/users") then File.open("userbase/users", 'w') {|f| f.write(YAML.dump(users)) }
		else File.new("userbase/users", 'w') {|f| f.write(YAML.dump(users)) } end
		f.close
	end
	#remove self
	BOT.command(:userremove, max_args: 0, min_args: 0, description: "Removes user from the database.", usage: "-userremove") do |event|
	  temp = users.find_index {|s| s.id == event.user.id}
	  if  temp!=nil
	    event << "Found #{event.user.name}"
	    users=users[0,temp].push(*users.drop(temp+1))
	    event << "Removed"
	    saveObj(users, "userbase/users")
		else
	    event << "No user found."
	  end
	  puts "#{clock.inspect}: #{event.user.name}: [userRemove]"
	end
	#Add guild
	BOT.command(:userguild, max_args: 1, min_args: 0, description: "Adds guild for user to the database.", usage: "-userguild <guildname>") do |event, guild=nil|
	  temp = users.find_index {|s| s.id == event.user.id}
	  if  temp!=nil then users[temp].addGuild(guild) end
	  event << "Changed guild to: #{guild}"
	  puts "#{clock.inspect}: #{event.user.name}: [userGuild] <#{guild}>"
	  saveObj(users,"userbase/users")
	end
	#Add timezone
	BOT.command(:usertimezone, max_args: 1, min_args: 0, description: "Adds timezone for user to the database.", usage: "-usertimezone <Timezone>") do |event, timezone=nil|
	  temp = users.find_index {|s| s.id == event.user.id}
	  if  temp!=nil then users[temp].addTimezone(timezone) end
	  event << "Changed timezone to: #{timezone}"
	  puts "#{clock.inspect}: #{event.user.name}: [userTimezone] <#{timezone}>"
	  saveObj(users,"userbase/users")
	end
	#Change ign
	BOT.command(:userign, max_args: 1, min_args: 1, description: "Changes IGN for user in the database.", usage: "-userign <IGN>") do |event, ign|
	  temp = users.find_index {|s| s.id == event.user.id}
	  if  temp!=nil then users[temp].addIgn(ign) end
	  event << "Changed IGN to #{ign}"
	  puts "#{clock.inspect}: #{event.user.name}: [userIgn] <#{ign}>"
	  saveObj(users,"userbase/users")
	end
	#kill the bot
	BOT.command(:kill, description: "kills felyne", permission_level: 800) do |event|
	  puts "Daisy... daisy, give me your answer do..."
	  BOT.send_message(event.message.channel, "Daisy... daisy, give me your answer do...")
	  BOT.stop
	  exit
	end

	#old commands !!NEED UPDATES!!
	#old global variables
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
	#rage
	BOT.command(:rage) do |event|
		BOT.profile.avatar = File.open('pic/avatar_rage.jpg')
		event.respond ragefelyne[rand(1..ragefelyne.length)]
	end
	#normal
	BOT.command(:normal) do |event|
		BOT.profile.avatar = File.open('pic/avatar_normal.jpg')
		event << '**BACK TO NORMAL!**'
	end

	#set up game maint timer
	BOT.command(:mainsetup, permission_level: 1) do |event, hours, minutes|
		h = hours.to_i
		m = minutes.to_i
		time = h * 3600 + m * 60
		event.respond "timer set for **#{hours}** hours and **#{minutes}** minutes"
		while time > 0
			sleep 1
			time -= 1
		end
	end
	#get maintenance long
	BOT.command(:maintenance) do |event|
		output = time
		a = output / 3600
		b = (output - a * 3600) / 60
		c = output - a * 3600 - b * 60
		event.respond "**#{a}:#{b}:#{c}** seconds left"
	end
	#get maintenance short
	BOT.command(:maint) do |event|
		output = time
		a = output / 3600
		b = (output - a * 3600) / 60
		c = output - a * 3600 - b * 60
		event.respond "**#{a}:#{b}:#{c}** seconds left"
	end
	#bot info
	BOT.command(:info) do |event|
		event << "```Ruby Version: #{RUBY_VERSION}"
		event << "Ruby patchlevel: #{RUBY_PATCHLEVEL}"
		event << "Ruby release date: #{RUBY_RELEASE_DATE}"
		event << 'Ruby DevelopmentKit: No Dev Kit (Linux)'
		event << 'System: FreeBSD 10.3-RELEASE-p3 amd64'
		event << 'Big Thanks to the Bot Community and @meew0'
		event << 'Creator: @ZerO (ask him if there are any questions)'
		event << 'Contributors: @Alice, @Reaver02'
		event << "#{p Uptime.uptime} Online```"
		event << 'updated: 15.06.2016```'
	end
	#ding
	BOT.command(:ding) do |event|
		event.respond 'Dong!'
	end
	#rp function
	BOT.command(:rp, permission_level: 1) do |event, *phrase|
		phrase = phrase.join(' ')
		event << "sent **#{phrase}** to mhodiscussion"
		BOT.send_message(122526505606709257, phrase)
	end
	#get raid time
	BOT.command(:raid) do |event|
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
	end
	#set raid 1
	BOT.command(:raid1, permission_level: 1) do |event, hours1, minutes1, *name1|
		name1 = name1.join(' ')
		name1s = name1
		h1 = hours1.to_i
		m1 = minutes1.to_i
		time1 = h1 * 3600 + m1 * 60
		event.respond "raid 1 set **#{hours1}h #{minutes1}m** as **#{name1}**"
		while time1 > 0
			sleep 1
			time1 -= 1
		end
	end
	#set raid 2
	BOT.command(:raid2, permission_level: 1) do |event, hours2, minutes2, *name2|
		name2 = name2.join(' ')
		name2s = name2
		h2 = hours2.to_i
		m2 = minutes2.to_i
		time2 = h2 * 3600 + m2 * 60
		event.respond "raid 2 set **#{hours2}h #{minutes2}m** as **#{name2}**"
		while time2 > 0
			sleep 1
			time2 -= 1
		end
	end
	#set raid 3
	BOT.command(:raid3, permission_level: 1) do |event, hours3, minutes3, *name3|
		name3 = name3.join(' ')
		name3s = name3
		h3 = hours3.to_i
		m3 = minutes3.to_i
		time3 = h3 * 3600 + m3 * 60
		event.respond "raid 3 set **#{hours3}h #{minutes3}m** as **#{name3}**"
		while time3 > 0
			sleep 1
			time3 -= 1
		end
	end
	#set raid 4
	BOT.command(:raid4, permission_level: 1) do |event, hours4, minutes4, *name4|
		name4 = name4.join(' ')
		name4s = name4
		h4 = hours4.to_i
		m4 = minutes4.to_i
		time4 = h4 * 3600 + m4 * 60
		event.respond "raid 4 set **#{hours4}h #{minutes4}m** as **#{name4}**"
		while time4 > 0
			sleep 1
			time4 -= 1
		end
	end
	#set raid 5
	BOT.command(:raid5, permission_level: 1) do |event, hours5, minutes5, *name5|
		name5 = name5.join(' ')
		name5s = name5
		h5 = hours5.to_i
		m5 = minutes5.to_i
		time5 = h5 * 3600 + m5 * 60
		event.respond "raid 5 set **#{hours5}h #{minutes5}m** named: **#{name5}**"
		while time5 > 0
			sleep 1
			time5 -= 1
		end
	end

	puts 'Loaded commands.'
	print 'Syncing BOT...'
	BOT.run :async
	BOT.game = '-help'
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	BOT.sync
end