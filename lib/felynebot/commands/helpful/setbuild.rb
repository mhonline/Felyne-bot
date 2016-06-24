module FelyneBot
	module Commands
		module SetBuild
			extend Discordrb::Commands::CommandContainer
			command(
					:setbuild,
					description: "Chinese set builder site.",
					useage: "setbuild"
			) do |event|
				event << "<http://gamer.qq.com/p/resource/myequip/iProductID/39>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: setbuild"
				nil
			end
		end
	end
end