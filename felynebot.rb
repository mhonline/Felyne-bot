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

#Method for saving arrays
def saveArr(ar,loc)
	if File.exist?(loc)
		f = File.open(loc,"w")
	else
		f = File.new(loc,"w")
	end
	f.write(ar.to_json)
	f.close
	puts "Saved File: [#{ar}] into [#{loc}]"

end

#Method for loading arrays
def loadArr(ar,loc)
	if File.exist?(loc)
		#puts 'Opened file'
		f = File.open(loc,"r")
	else
		#puts 'No file!'
	end
	buff = f.read
	ar=JSON.parse(buff)
	#puts 'Loaded array!'
	return ar
end

#Load object arrays
def loadObj(ar,loc)
	if File.exist?(loc)
    f = File.open(loc,"r")
    users=YAML.load(ar)
    puts 'Loaded user database'
    f.close
  else
    puts 'No file to load!'
  end
end

#save object arrays
def saveObj(ar,loc)
  ar.sort! { |a,b| a.name.downcase <=> b.name.downcase }
	if File.exist?(loc) then File.open(loc, 'w') {|f| f.write(YAML.dump(ar)) }
	else File.new(loc, 'w') {|f| f.write(YAML.dump(ar)) } end
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
bot = Discordrb::Commands::CommandBot.new token: token, application_id: id, prefix: '-', advanced_functionality: false

bot.debug = false
puts 'Bot Created!'

#Loads permissions from array
puts 'Permessions Loading!'
permarray=[]
permarray = loadArr(permarray,"userbase/perm")

#Loading permissions array
pos=0
begin
	bot.set_user_permission(permarray[pos],permarray[pos+1])
	puts "Added #{permarray[pos+2]} as level #{permarray[pos+1]} user"
	pos+=3
end while pos < permarray.length
puts "------------->Permission Loaded!"


#Add a user to the database (Now with objects!)
bot.command(:adduser,min_args: 1, max_args: 1, description: "Adds a user the the database. -adduser <IGN>", usage: "-adduser <IGN>") do |event, ign|
  puts "#{clock.inspect}: #{event.user.name}: -adduser <#{ign}>"
  tempUser= User.new(event.user.id, event.user.name, ign, users, event.message.channel, bot)
  saveObj(users,"userbase/users")
  puts "Command worked"
end
#Show user database
bot.command(:userlist, min_args: 0, max_args: 1, description: "Shows the user database.") do |event, page=1|

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
bot.command(:userfind, min_args: 1, max_args: 1) do |event, search|
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
bot.command(:time) do |event|
  t2 = Time.now.to_i
  t1 = Time.parse("20:00").to_i
  if t1 > t2 then event << "#{Time.at(t1 - t2).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next ticket reset"
  else event << "#{Time.at(t1 + 86400 - t2).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next ticket reset" end
  puts "#{clock.inspect}: #{event.user.name}: -time"
end
#Load userdatabase
bot.command(:load, description: "Loads user array file.", usage: "-load", permission_level: 100) do |event|
	if File.exist?("userbase/users") then f = File.open("userbase/users","r") end
	users=YAML.load(f)
	puts 'Loaded user database'
  f.close
end
#save user database
bot.command(:save, description: "Saves user array to file.", usage: "-save", permission_level: 100) do |event|
	if File.exist?("userbase/users") then File.open("userbase/users", 'w') {|f| f.write(YAML.dump(users)) }
	else File.new("userbase/users", 'w') {|f| f.write(YAML.dump(users)) } end
	f.close
end
#remove self
bot.command(:userremove, max_args: 0, min_args: 0, description: "Removes user from the database.", usage: "-userremove") do |event|
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
bot.command(:userguild, max_args: 1, min_args: 0, description: "Adds guild for user to the database.", usage: "-userguild <guildname>") do |event, guild=nil|
  temp = users.find_index {|s| s.id == event.user.id}
  if  temp!=nil then users[temp].addGuild(guild) end
  event << "Changed guild to: #{guild}"
  puts "#{clock.inspect}: #{event.user.name}: [userGuild] <#{guild}>"
  saveObj(users,"userbase/users")
end
#Add timezone
bot.command(:usertimezone, max_args: 1, min_args: 0, description: "Adds timezone for user to the database.", usage: "-usertimezone <Timezone>") do |event, timezone=nil|
  temp = users.find_index {|s| s.id == event.user.id}
  if  temp!=nil then users[temp].addTimezone(timezone) end
  event << "Changed timezone to: #{timezone}"
  puts "#{clock.inspect}: #{event.user.name}: [userTimezone] <#{timezone}>"
  saveObj(users,"userbase/users")
end
#Change ign
bot.command(:userign, max_args: 1, min_args: 1, description: "Changes IGN for user in the database.", usage: "-userign <IGN>") do |event, ign|
  temp = users.find_index {|s| s.id == event.user.id}
  if  temp!=nil then users[temp].addIgn(ign) end
  event << "Changed IGN to #{ign}"
  puts "#{clock.inspect}: #{event.user.name}: [userIgn] <#{ign}>"
  saveObj(users,"userbase/users")
end
#kill the bot
bot.command(:kill, description: "kills felyne", permission_level: 800) do |event|
  puts "Daisy... daisy, give me your answer do..."
  bot.send_message(event.message.channel, "Daisy... daisy, give me your answer do...")
  bot.stop
  exit
end

#old commands !!NEED UPDATES!!
#set up game maint timer
bot.command(:mainsetup, permission_level: 1) do |event, hours, minutes|
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
bot.command(:maintenance) do |event|
	output = time
	a = output / 3600
	b = (output - a * 3600) / 60
	c = output - a * 3600 - b * 60
	event.respond "**#{a}:#{b}:#{c}** seconds left"
end
#get maintenance short
bot.command(:maint) do |event|
	output = time
	a = output / 3600
	b = (output - a * 3600) / 60
	c = output - a * 3600 - b * 60
	event.respond "**#{a}:#{b}:#{c}** seconds left"
end


puts 'Loaded commands.'
print 'Syncing bot...'
bot.run :async
bot.game = '-help'
puts 'Sync Confirmed.'
puts 'SKYNET ONLINE'
bot.sync
