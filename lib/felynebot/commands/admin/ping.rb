module FelyneBot
	module Commands
		module Ping
			extend Discordrb::Commands::CommandContainer
			command(
					:ping,
					description: "Responds with response time",
					useage: "ping"
			) do |event|
				x = `ping -c 1 ied-tqos.qq.com | grep icmp_seq`
				event.respond  "#{x}"
				puts "#{event.timestamp}: #{event.user.name}: CMD: ping"
				nil
			end
		end
	end
end
