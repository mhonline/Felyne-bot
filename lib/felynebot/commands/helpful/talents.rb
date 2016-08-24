module FelyneBot
	module Commands
		module Talents
			extend Discordrb::Commands::CommandContainer
			command(
					:talents,
					bucket: :delay10,
					description: "Talents Google Doc.",
					useage: "talents"
			) do |event|
				event.respond "<https://docs.google.com/spreadsheets/d/1BxuqoC1thjCVWfCq_At7ce_gssemdh4SlQ1SXyJuKc0/edit>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: talents"
				nil
			end
		end
	end
end