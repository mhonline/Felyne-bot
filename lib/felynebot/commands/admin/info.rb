module FelyneBot
	module Commands
		module Info
			extend Discordrb::Commands::CommandContainer
			command(
					:info,
					description: "Responds with server info",
					useage: "info"
			) do |event|
				event.respond "```ruby\nRuby Version: #{RUBY_VERSION}\nRuby patchlevel: #{RUBY_PATCHLEVEL}\nRuby release date: #{RUBY_RELEASE_DATE}\nRuby DevelopmentKit: No Dev Kit (Linux)\nOperating System: FreeBSD\nBig Thanks to the Bot Community and @meew0\nCreator: @ZerO (ask him if there are any questions)\nContributors: @Reaver01 and @Alice\nupdated: 06.2016```"
				puts "#{event.timestamp}: #{event.user.name}: CMD: info"
				nil
			end
		end
	end
end

