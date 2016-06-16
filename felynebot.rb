module FelyneBot
	#Simple prompt for input


		#Open file for token/Get Token
	require_relative 'class/info'
	puts "Loaded info"

	users=[]

	info=Info.new('bot/token','bot/id')
	token=info.token
	id=info.id

	bot = Discordrb::Commands::CommandBot.new token: token, application_id: id, prefix: '-', advanced_functionality: false
	puts "Bot begun"

	bot.include! Commands::Ping

	puts "Commands Loaded"
	bot.debug = false
	bot.run
	bot.run :async
	bot.game = '-help'
	puts 'Sync Confirmed.'
	puts 'SKYNET ONLINE'
	bot.sync
end
