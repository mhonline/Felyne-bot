module FelyneBot
	require_relative 'class/info'
	puts "Loaded info"

	$users=[]
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
		puts "Added #{permarray[pos+2]} as level #{permarray[pos+1]} user"
		pos+=3
	end while pos < permarray.length
	puts "------------->Permission Loaded!"

	$bot.include! Commands::Ping
	$bot.include! Commands::Kill
	$bot.include! Commands::AddUser
	$bot.include! Commands::Game

	#avatar changer
	scheduler = Rufus::Scheduler.new
	scheduler.every '30s' do
		$AVATAR = 1 + rand(35)
		$AVATAR = $AVATAR.to_s
		puts "Changing Avatar"
		bot.profile.avatar = File.open("/Felyne-bot/pic/#{$AVATAR}.jpg")
	end

	puts "Commands Loaded"
	$bot.debug = false
	$bot.run :async
	$bot.game = '-help'
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	$bot.sync
end
