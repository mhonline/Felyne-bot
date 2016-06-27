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
					event << "``Lance Sets:``"
				end
				if ["Gunlance", "gunlance", "GL", "Gl", "gl"].include? weapon
					event << "``Gunlance Sets:``"
				end
				if ["Sword and Shield", "sword and shield", "SnS", "SNS", "sns"].include? weapon
					event << "``Sword and Shield Sets:``"
				end
				if ["Greatsword", "greatsword", "GS", "Gs", "gs"].include? weapon
					event << "``Greatsword Sets:``"
				end
				if ["Longsword", "longsword", "LS", "Ls", "ls"].include? weapon
					event << "``Longsword Sets:``"
				end
				if ["Hammer", "hammer", "H", "h"].include? weapon
					event << "``Hammer Sets:``"
				end
				if ["Dual Blades", "dual blades", "DB", "Db", "db", "DS", "Ds", "ds", "Dual Swords", "dual swords"].include? weapon
					event << "``Dual Blades Sets:``"
				end
				if ["Hunting Horn", "hunting horn", "HH", "Hh", "hh"].include? weapon
					event << "``Hunting Horn Sets:``"
				end
				if ["Bow", "bow", "B", "b"].include? weapon
					event << "``Bow Sets:``"
				end
				if ["Bowgun", "bowgun", "BG", "Bg", "bg"].include? weapon
					event << "``Bowgun Sets:``"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: sets <#{weapon}>"
				nil
			end
		end
	end
end