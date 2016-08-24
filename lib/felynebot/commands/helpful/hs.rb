module FelyneBot
	module Commands
		module HS
			extend Discordrb::Commands::CommandContainer
			command(
					:hs,
					bucket: :delay10,
					description: "Hunter Set Guide.",
					useage: "hs"
			) do |event|
				event.respond "Hunter Set guide."
				event.respond "<https://docs.google.com/document/d/1mgNfvccxI8f92bp3bP-KiGZKN77vvQf_qreI-2JR5o8/edit>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: hs"
				nil
			end
		end
	end
end