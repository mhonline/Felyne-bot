module FelyneBot
	module Commands
		module Wiki
			extend Discordrb::Commands::CommandContainer
			command(
					:wiki,
					bucket: :delay10,
					description: "Searches the Wiki",
					useage: "wiki <search>"
			) do |event, list, *search|
				search = search.join(' ')
				if list == nil
					event.respond "<http://monsterhunteronline.in>"
				else
					if list == 'mats'
						event.respond "<http://monsterhunteronline.in/materials/?search=#{search}>"
					else
						if list == 'skill'
							event.respond "<http://monsterhunteronline.in/skills/?search=#{search}>"
						else
							if list == 'armor'
								event.respond "<http://monsterhunteronline.in/armor/?search=#{search}>"
							else
								if list == 'monsters'
									event.respond "<http://monsterhunteronline.in/monsters>"
								else
									wiki = $wikilinks
									links = ""
									wiki.grep(/#{list}/).each { |x| links << "<http://monsterhunteronline.in/#{x}> \n" }
									if links.length > 2000
										event.respond "Output has too many characters. Please be more specific in your search."
									else
										if links.length < 1
											event.respond "I wasn't able to dig up any results.  Please try something else!"
										else
											event.respond links
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
