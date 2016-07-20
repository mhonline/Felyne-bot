module FelyneBot
	module Commands
		module Translate
			extend Discordrb::Commands::CommandContainer
			command(
					:t,
					description: "Translates text using community built tranlations",
					usage: "t <chinese>",
			) do |event, text|
				translations = {
				    "双刀":"Dual Blades",
				    "大剑":"Greatsword",
				    "大锤":"Hammer",
				    "太刀":"Longsword",
				    "弓":"Bow",
				    "弩炮":"Bowgun",
				    "片手剑":"Sword and Shield",
				    "狩猎笛":"Hunting Horn",
				    "铳枪":"Gunlance",
				    "长枪":"Lance",
				}
				event.respond "#{translations[:text]}"
				puts "#{event.timestamp}: #{event.user.name}: CMD: raid1 <#{name}> <#{t4}>"
			end
		end
	end
end