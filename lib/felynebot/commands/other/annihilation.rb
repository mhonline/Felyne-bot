module FelyneBot
	module Commands
		module Annihilation
			extend Discordrb::Commands::CommandContainer
			command(
					:anni,
					permission_level: 1,					
			) do |event, number|
				gcount = IO.readlines("bot/gcount")[0]
				gcount = gcount.to_i
				ecount = IO.readlines("bot/ecount")[0]
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