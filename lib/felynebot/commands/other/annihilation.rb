module FelyneBot
	module Commands
		module Annihilation
			extend Discordrb::Commands::CommandContainer
			command(
					:anni,
			) do |event, number|
				gcount = IO.readlines("bot/gcount")[0]
				gcount = gcount.to_i
				a = gcount/1000
				event << "Annihilation Program is currently #{a}% loaded."
				puts "#{event.timestamp}: #{event.user.name}: CMD: annil"
				nil
			end
		end
	end
end