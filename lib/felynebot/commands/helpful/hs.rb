module FelyneBot
	module Commands
		module HS
			extend Discordrb::Commands::CommandContainer
			command(
					:hs,
					description: "Athena's ASS Program fixed by Love2BeHated.",
					useage: "hs"
			) do |event|
				event << "Hunter Set guide."
				event << "<https://docs.google.com/document/d/1mgNfvccxI8f92bp3bP-KiGZKN77vvQf_qreI-2JR5o8/edit>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: hs"
				nil
			end
		end
	end
end