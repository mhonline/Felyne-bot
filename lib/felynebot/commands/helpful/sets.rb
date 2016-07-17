module FelyneBot
	module Commands
		module Sets
			extend Discordrb::Commands::CommandContainer
			command(
					:sets,
					description: "Lists recommended sets for <weapon>.",
					useage: "sets <weapon>",
					min_args: 1,
			) do |event, *weapon|
				weapon = weapon.join(' ')
				if ["Lance", "lance", "L", "l"].include? weapon
					event.respond "``Lance Sets:``"
				end
				if ["Gunlance", "gunlance", "GL", "Gl", "gl"].include? weapon
					event.respond "``Gunlance Sets:``"
				end
				if ["Sword and Shield", "sword and shield", "SnS", "SNS", "sns"].include? weapon
					event.respond "``Sword and Shield Sets:``"
				end
				if ["Greatsword", "greatsword", "GS", "Gs", "gs"].include? weapon
					event.respond "``Greatsword Sets:``"
				end
				if ["Longsword", "longsword", "LS", "Ls", "ls"].include? weapon
					event.respond "``Longsword Sets:``"
				end
				if ["Hammer", "hammer", "H", "h"].include? weapon
					event.respond "``Hammer Sets:``"
				end
				if ["Dual Blades", "dual blades", "DB", "Db", "db", "DS", "Ds", "ds", "Dual Swords", "dual swords"].include? weapon
					event.respond "``Dual Blades Sets:``"
				end
				if ["Hunting Horn", "hunting horn", "HH", "Hh", "hh"].include? weapon
					event.respond "``Hunting Horn Sets:``"
				end
				if ["Bow", "bow", "B", "b"].include? weapon
					event.respond "Bow Sets:\nSleep C+ Set: <http://monsterhunteronline.in/armor/?1=61496&2=61497&3=61358&4=61499&5=61500&8=81002&9=38&10=6&15=29010&16=29010&18=29262&21=29126&24=29124&25=29262&27=29262&28=29262>"
				end
				if ["Bowgun", "bowgun", "BG", "Bg", "bg"].include? weapon
					event.respond "Bowgun Sets:\nRecoil + Set: <http://monsterhunteronline.in/armor/?1=61496&4=61499&5=61500&2=61357&3=61358&8=81007&9=32&10=4&15=29273&16=29273&18=29273&19=29273&21=29273&22=29273&23=29124&24=29124&25=29124&27=29124&28=29124>"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: sets <#{weapon}>"
				nil
			end
		end
	end
end