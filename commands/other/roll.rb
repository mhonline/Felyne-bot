module FelyneBot
	module Commands
		module Roll
			extend Discordrb::Commands::CommandContainer
			command(
					:roll,
			) do |event, number=6|
				event << "A D#{number} is rolled: #{rand(1..number)}"
				puts "#{event.timestamp}: #{event.user.name}: CMD: roll"
				nil
			end
		end
	end
end