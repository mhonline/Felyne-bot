module Commands
	module Wiki
		extend Discordrb::Commands::CommandContainer
		command(
				:wiki,
				bucket: :delay10,
				description: "Searches the Wiki",
				useage: "wiki <search>"
		) do |event, list, *search|
			wikilinks = ["armor", "cats", "crafting", "faq", "food", "gathering", "hunter-set", "hunter-set/#blademaster", "hunter-set/#gunner", "hunter-set/#list", "hunter-set/#info", "hunting-groups", "install", "jewelry", "materials", "monsters", "monsters/akura-jebia", "monsters/akura-vashimu", "monsters/azure-rathalos", "monsters/baelidae", "monsters/basarios", "monsters/blangonga", "monsters/blue-yian-kut-ku", "monsters/bulldrome", "monsters/burning-tartaronis", "monsters/caeserber", "monsters/cephadrome", "monsters/chameleos", "monsters/chramine", "monsters/conflagration-rathian", "monsters/congalala", "monsters/crystal-basarios", "monsters/daimyo-hermitaur", "monsters/diablos", "monsters/doom-estrellian", "monsters/dread-baelidae", "monsters/elemental-merphistophelin", "monsters/estrellian", "monsters/flame-blangonga", "monsters/gendrome", "monsters/ghost-caeserber", "monsters/giadrome", "monsters/gold-congalala", "monsters/gold-hypnocatrice", "monsters/gonngenn-hermitaur", "monsters/gravios", "monsters/guren-shen-gaoren", "monsters/gypceros", "monsters/hypnocatrice", "monsters/ice-chramine", "monsters/imag", "monsters/iodrome", "monsters/khezu", "monsters/kushala-daora", "monsters/lavasioth", "monsters/lightenna", "monsters/merphistophelin", "monsters/monoblos", "monsters/one-eared-yian-garuga", "monsters/pink-rathian", "monsters/plesioth", "monsters/purple-gypceros", "monsters/purple-slicemargl", "monsters/rajang", "monsters/rathalos", "monsters/rathian", "monsters/red-khezu", "monsters/sandstone-basarios", "monsters/shattered-monoblos", "monsters/shen-gaoren", "monsters/shogun-ceanataur", "monsters/silver-hypnocatrice", "monsters/slicemargl", "monsters/swordmaster-shogun-ceanataur", "monsters/tartaronis", "monsters/tepekki-shen-gaoren", "monsters/tigrex", "monsters/velocidrome", "monsters/white-monoblos", "monsters/yellow-caeserber", "monsters/yian-garuga", "monsters/yian-kut-ku", "mosaics", "npcs", "quests", "quests/#arena", "quests/#bounty", "quests/#elites", "quests/#monsters", "quests/#raids", "quests/#tickets", "quests/#unstable", "skills", "talismans", "talismans/table", "translation", "vip", "weapon-stone", "weapons", "weapons/bow", "weapons/bowgun", "weapons/dual-blades", "weapons/greatsword", "weapons/gunlance", "weapons/hammer", "weapons/hunting-horn", "weapons/lance", "weapons/longsword", "weapons/switch-axe", "weapons/sword-and-shield"]
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
								if list == 'random'
									event.respond "<http://monsterhunteronline.in/#{wikilinks[rand(0..(wikilinks.length-1))]}>"
								else
									wiki = wikilinks
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
			end
			puts "#{event.timestamp}: #{event.user.name}: CMD: wiki <#{search}>"
			nil
		end
	end
end
