module FelyneBot
	module Commands
		module Catskill
			extend Discordrb::Commands::CommandContainer
			command(
					:catskill,
					bucket: :delay10,
					description: "Shows cat skill doc",
					useage: "catskill"
			) do |event|
				event.respond "<https://docs.google.com/document/d/1ieqFQHMUSyMIui0uIfQMTPVyDFSWHNe5fVjsX3LTDDM/edit?usp=sharing>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: catskill"
				nil
			end
		end
	end
end
