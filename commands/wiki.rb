module FelyneBot
	module Commands
		module Wiki
			extend Discordrb::Commands::CommandContainer
			command(:wiki, description: 'Searches the Wiki') do |event, list|
				wiki = IO.readlines("bot/wiki")[0]
				wiki = wiki.split(",")
				wiki.grep(/#{list}/).each { |x| links = "http://monsterhunteronline.in/#{x}\n" }
				event << links
				nil
			end
		end
	end
end