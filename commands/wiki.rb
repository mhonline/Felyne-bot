module FelyneBot
	module Commands
		module Wiki
			extend Discordrb::Commands::CommandContainer
			command(:wiki, description: 'Searches the Wiki') do |event, list|
				wiki = IO.readlines("bot/wiki")[0]
				wiki = wiki.split(",")
				links = ""
				wiki.grep(/#{list}/).each { |x| links << "http://monsterhunteronline.in/#{x} \n" }
				links = links.gsub(/^(.{1500,}?).*$/m,'\1...')
				event << links

				nil
			end
		end
	end
end