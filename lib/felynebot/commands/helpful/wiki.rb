module FelyneBot
	module Commands
		module Wiki
			extend Discordrb::Commands::CommandContainer
			command(
					:wiki,
					description: "Searches the Wiki",
					useage: "wiki <search>"
			) do |event, list, *search|
				search = search.join(' ')
				if list == nil
					event << "<http://monsterhunteronline.in>"
				else
					if list == 'mats'
						event << "<http://monsterhunteronline.in/materials/?search=#{search}>"
					else
						if list == 'skill'
							event << "<http://monsterhunteronline.in/skills/?search=#{search}>"
						else
							if list == 'armor'
								event << "<http://monsterhunteronline.in/armor/?search=#{search}>"
							else
								if list == 'monsters'
									event << "<http://monsterhunteronline.in/monsters>"
								else
									wiki = IO.readlines("bot/wiki")[0]
									wiki = wiki.split(",")
									links = ""
									wiki.grep(/#{list}/).each { |x| links << "<http://monsterhunteronline.in/#{x}> \n" }
									if links.length > 2000
										event << "Output has too many characters. Please be more specific in your search."
									else
										if links.length < 1
											event << "I wasn't able to dig up any results.  Please try something else!"
										else
											event << links
										end
									end
								end
							end
						end
					end
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: wiki <#{search}>"
				nil
			end
		end
	end
end