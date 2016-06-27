module FelyneBot
	module Commands
		module Annihilation
			extend Discordrb::Commands::CommandContainer
			command(
					:anni,
					permission_level: 2,					
			) do |event, number|
				gcount = getline("bot/gcount",1)
				gcount = gcount.to_i
				ecount = getline("bot/ecount",1)
				ecount = ecount.to_i
				a = (gcount / 10.00)
				b = (ecount / 20.00)
				event << "Annihilation Program is currently #{a}% loaded."
				event << "Annihilation interrupt Program is currently #{b}% loaded."
				puts "#{event.timestamp}: #{event.user.name}: CMD: annil"
				nil
			end
		end
	end
end