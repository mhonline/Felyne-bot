module FelyneBot
	module Commands
		module Last
			extend Discordrb::Commands::CommandContainer
			command(:last, description: 'Gets the last message seen of a user.', usage: "<@user>", min_arguments: 1, max_arguments: 1) do |event, person|
				x=person[2..-2].to_i
				if $mess.any?{|a| a.id == x}
					pos=$mess.find_index {|item| item.id == x}
					event.respond "On: #{$mess[pos].time.asctime}"
					event.respond "They said: #{$mess[pos].mess}"
				else
					event.respond "Nothing saved from that user."
				end
			end
		end
	end
end
