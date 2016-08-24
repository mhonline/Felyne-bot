module FelyneBot
	module Commands
		module Shell
			extend Discordrb::Commands::CommandContainer
			command(
					:shell,
					bucket: :delay10,
					description: "Shell copypasta for ref.",
					useage: "shell"
			) do |event|
				event.respond "```ruby\nArtillery +1 gives more shell damage, +2 even more shell damage and lower WF cooldown\nNormal: uses least amount of sharpness per shell, lowest base shell damage but has 5 shells so you can combo really well with it, and does really good Full Burst damage.\nLong: more shell damage/sharp cost, significantly higher Wyvern Fire damage and lowered CD (with artillery 2 it's a 50 secs CD!) Only has 3 shells but they shoot farther than normal, makes it easier to snipe parts\nWide: highest shell damage/cost, shells are really easy to land but hard to hit specific parts with their large AOE. Much higher Charged Shell damage, as in like 50\% more, it's strong. 2 shells so FB sucks\nSimply, Normal = combo a lot, FB and Heat Blade. Long = sniping parts, spam charged WF. Wide = shell like a mofo and charged shell when you can.```"
				puts "#{event.timestamp}: #{event.user.name}: CMD: shell"
				nil
			end
		end
	end
end