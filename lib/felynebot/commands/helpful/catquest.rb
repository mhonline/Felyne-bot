module FelyneBot
	module Commands
		module CatQuest
			extend Discordrb::Commands::CommandContainer
			command(
					:catquest,
					description: "Cat quest description doc.",
					useage: "catquest"
			) do |event|
				event.respond "<https://docs.google.com/document/d/1g7A9qFGUGBZRvD1Kui4kbJSGzCKg5UaYIM-90O67gcE/edit>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: catquest"
				nil
			end
		end
	end
end