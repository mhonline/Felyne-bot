module FelyneBot
	module Commands
		module Sets
			extend Discordrb::Commands::CommandContainer
			command(
					:sets,
					description: "Lists recommended sets for <weapon>.",
					useage: "sets <weapon>"
			) do |event, *weapon|
				weapon = weapon.join(' ')
				if weapon == "Lance" || "lance" || "L" || "l"
					event << "``Lance Sets:``"
				end
				if weapon == "Gunlance" || "gunlance" || "GL" || "Gl" || "gl"
					event << "``Gunlance Sets:``"
				end
				if weapon == "Sword and Shield" || "sword and shield" || "SnS" || "SNS" || "sns"
					event << "``Sword and Shield Sets:``"
				end
				if weapon == "Greatsword" || "greatsword" || "GS" || "Gs" || "gs"
					event << "``Greatsword Sets:``"
				end
				if weapon == "Longsword" || "longsword" || "LS" || "Ls" || "ls"
					event << "``Longsword Sets:``"
				end
				if weapon == "Hammer" || "hammer" || "H" || "h"
					event << "``Hammer Sets:``"
				end
				if weapon == "Dual Blades" || "dual blades" || "DB" || "Db" || "db" || "DS" || "Ds" || "ds" || "Dual Swords" || "dual swords"
					event << "``Dual Blades Sets:``"
				end
				if weapon == "Hunting Horn" || "hunting horn" || "HH" || "Hh" || "hh"
					event << "``Hunting Horn Sets:``"
				end
				if weapon == "Bow" || "bow" || "B" || "b"
					event << "``Bow Sets:``"
				end
				if weapon == "Bowgun" || "bowgun" || "BG" || "Bg" || "bg"
					event << "``Bowgun Sets:``"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: sets <#{weapon}>"
				nil
			end
		end
	end
end