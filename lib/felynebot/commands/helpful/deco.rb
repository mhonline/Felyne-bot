module FelyneBot
	module Commands
		module Deco
			extend Discordrb::Commands::CommandContainer
			command(
					:deco,
					description: "Sm0's deco spreadsheet.",
					useage: "deco"
			) do |event|
				event.respond "Spreadsheet: <https://docs.google.com/spreadsheets/d/1tUgHNAudHxi1tuqrgosxjN-8UMXS42MqvGZCoC5wlwQ/edit?pref=2&pli=1#gid=1726240515>"
				event.respond "Reddit post for bug reporting: <https://www.reddit.com/r/MHOnline/comments/4p7ivf/damage_calculator_for_mho/>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: deco"
				nil
			end
		end
	end
end