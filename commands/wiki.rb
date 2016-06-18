module FelyneBot
	module Commands
		module Wiki
			extend Discordrb::Commands::CommandContainer
			command(:wiki, description: 'Searches the Wiki') do |event, list|
				wiki = IO.readlines("bot/wiki")[0]
				wiki = wiki.split(",")
				links = ""
				wiki.grep(/#{list}/).each { |x| links << "http://monsterhunteronline.in/#{x} \n" }
				if links.length > 2000
					event << "Output has too many characters. Please be more specific in your search."
				else
					event << links
				end
				nil
			end
		end
	end
end