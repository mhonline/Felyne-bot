module Commands
	module Ask
		extend Discordrb::Commands::CommandContainer
		command(
				:ask,
				bucket: :delay10
		) do |event|
			options = ["It is certain","It is decidedly so","Without a doubt","Yes, definitely","You may rely on it","As I see it, yes","Most likely","Outlook good","Yes","Signs point to yes","Reply hazy try again","Ask again later","Better not tell you now","Cannot predict now","Concentrate and ask again","Don't count on it","My reply is no","My sources say no","Outlook not so good","Very doubtful"]
			event.respond ":8ball:#{options[rand(0..19)]}:8ball:"
			puts "#{event.timestamp}: #{event.user.name}: CMD: ask"
			nil
		end
	end
end
