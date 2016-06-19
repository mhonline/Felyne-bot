module FelyneBot
	module Commands
		module Ping
			extend Discordrb::Commands::CommandContainer
			command(:ping, description: 'Responds with response time') do |event, *text|
				event <<  "Pong! #{text.join(' ')} : #{((Time.now - event.timestamp) * 1000).to_i}ms."
				nil
			end
		end
	end
end