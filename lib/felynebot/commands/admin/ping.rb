module FelyneBot
	module Commands
		module Ping
			extend Discordrb::Commands::CommandContainer
			command(
					:ping,
					description: "Responds with response time",
					useage: "ping"
			) do |event, ip|
				if ip == nil
					ip = "ied-tqos.qq.com"
				end
				x = `ping -c 1 #{ip} | grep icmp_seq`
				event.respond  "#{x}"
				puts "#{event.timestamp}: #{event.user.name}: CMD: ping"
				nil
			end
		end
	end
end
