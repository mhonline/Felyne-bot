module FelyneBot
	module Commands
		module Hosting
			extend Discordrb::Commands::CommandContainer
			command(
					:hosting,
					bucket: :delay10
			) do |event|
				event.respond "Felyne is hosted on DigitalOcean Servers.\nHost your own bot/app with $10 credit using my referral link: <https://m.do.co/c/71922c060e60>\nThis will help me keep Felyne live as long as you keep using their hosting after the first $10 credit :D"
				puts "#{event.timestamp}: #{event.user.name}: CMD: hosting"
				nil
			end
		end
	end
end
