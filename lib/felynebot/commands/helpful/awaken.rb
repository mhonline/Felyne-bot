module FelyneBot
	module Commands
		module Awaken
			extend Discordrb::Commands::CommandContainer
			command(
					:awaken,
					description: "Awaken Copypasta.",
					useage: "awaken"
			) do |event|
				event << "```ruby\nbasically, when u awaken a weapon , u gain a special awakening gauge during hunts\nwhen youre doing damage , u fill up that gauge\nwhen its full , it automatically activates a buff that gives you damage, 5\% crit chance and movement speed\nthe buff lasts for 35 seconds\nthen u need to fill up that gauge again\neach activation of that buff consumes a charge\nwhen the weapon is out of awakening charges\nu need to refill them\nby paying\n8k silver = 60 charges```"
				puts "#{event.timestamp}: #{event.user.name}: CMD: awaken"
				nil
			end
		end
	end
end