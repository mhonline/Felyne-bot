module FelyneBot
	module Commands
		module Damage
			extend Discordrb::Commands::CommandContainer
			command(
					:damage,
					bucket: :delay10,
					description: "Damage copypasta for ref.",
					useage: "damage"
			) do |event|
				event.respond "```ruby\nPercentage Based Damage Increase\n--------------------------------\nGuild Attack Buff: 3% & 7%\nAdrenaline: 10% & 20% & 30%\nUnscathed: 7%\nChallenger: 8% & 16%\nCat Meal Attack Up: 10% & 15%\nButterfly Dance: 5%\nUnload Armor: ?\nLongsword Spirit Gauge: 15%, 25% & 50%\nAttack Up: 2%, 4%, 6%, 8% & 10%\nX Elem. Attack Up: 6%, 12% & 18%\nAll Elem. Attack Up: 8%, 16% & 18%\nHormone: 4%\nNinja Cat's Attack Buff: 8%\nFixed Damage Increase\n--------------------------------\nCat's Attack Buff: 8, 16, 24, 32 & 40\nCat's Attack Flute: 5, 10 & 15\nUnknown Cat's Skill: 5, 10 & 15\nIndependent Damage Increase\n--------------------------------\nWeakness Exploit: 5%\nXX Killer: 6%\nNormal Up: 7%\nScatter Up: 7%\nPierce Up: 7%\nAssassin Tech: 7%\nCat's Bravery Skill: 4%, 8%, 12% & 16%```"
				puts "#{event.timestamp}: #{event.user.name}: CMD: damage"
				nil
			end
		end
	end
end
