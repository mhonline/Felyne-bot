module FelyneBot
	module Commands
		module Info
			extend Discordrb::Commands::CommandContainer
			command(
					:info,
					description: "Responds with server info",
					useage: "info"
			) do |event|
				event << "```Ruby Version: #{RUBY_VERSION}"
				event << "Ruby patchlevel: #{RUBY_PATCHLEVEL}"
				event << "Ruby release date: #{RUBY_RELEASE_DATE}"
				event << 'Ruby DevelopmentKit: No Dev Kit (Linux)'
				event << 'Operating System: FreeBSD'
				event << 'Big Thanks to the Bot Community and @meew0'
				event << 'Creator: @ZerO (ask him if there are any questions)'
				event << 'Contributors: @Reaver01 and @Alice'
				event << 'updated: 06.2016```'
				puts "#{event.timestamp}: #{event.user.name}: CMD: info"
				nil
			end
		end
	end
end

