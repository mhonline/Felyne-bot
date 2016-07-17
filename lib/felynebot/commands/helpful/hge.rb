module FelyneBot
	module Commands
		module HGE
			extend Discordrb::Commands::CommandContainer
			command(
					:hge,
					description: "HGE Copypasta.",
					useage: "hge"
			) do |event|
				event.respond "```ruby\nMonsters that require High Grade Earplugs:\n\nkhezu\nred khezu\nGaruga\n1eared Garuga\nmonoblos\nshattered monoblos\ndiablos\ntigrex\nbasarios\ncrystal basarios\nsand basarios\ntartaronis\nmerphistophelin\nslicemargl```"
				puts "#{event.timestamp}: #{event.user.name}: CMD: hge"
				nil
			end
		end
	end
end