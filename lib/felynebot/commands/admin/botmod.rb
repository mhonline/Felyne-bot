module FelyneBot
	module Commands
		module BotMod
			extend Discordrb::Commands::CommandContainer
			command(
					:botmod,
					description: "Adds mod permissions to Felyne.",
					useage: "botmod <@name> <level> <force>",
					permission_level: 800,
					min_args: 1,
					max_args: 4,
					permission_message: "I'm sorry Dave, I cannot do that.",
			) do |event, uname, level=1, force="no"|
				del = "no"
				if level == "delete"
					del = "yes"
				end
				level = level.to_i
				permarray = []
				permarray = loadArr(permarray,"userbase/perm")
				if $bot.parse_mention(uname) !=nil
					userid = $bot.parse_mention(uname).id
					username = $bot.parse_mention(uname).name
					if permarray.include? userid
						event.respond "User permissions found... Updating permissions."
						hash = Hash[permarray.map.with_index.to_a]
						i = hash[userid].to_i
						curlevel = permarray[i+1]
						event.respond "Current permission level: #{curlevel}"
						if [800, 999].include? curlevel
							if del == "yes"
								if force == "yes"
									event.respond "Force deleting user's permissions"
									permarray.delete_at(i+2)
									permarray.delete_at(i+1)
									permarray.delete_at(i)
								else
									event.respond "You must force deletion of admin or botmaster"
								end
							else
								if force == "yes"
									event.respond "Forcing permission change to lower level."
									permarray[i+1] = level
								end
								if force == "no"
									event.respond "User permissions level is admin or higher, you must force permissions change to set lower."
								end
							end
						else
							if del == "yes"
								event.respond "Deleting user's permissions"
								permarray.delete_at(i+2)
								permarray.delete_at(i+1)
								permarray.delete_at(i)
							else
								event.respond "Changing user's permissions"
								permarray[i+1] = level
							end
						end
					else
						event.respond "User permissions not found... Adding permissions."
						permarray.push(userid,level,username)
					end
					File.write('userbase/perm', permarray.to_s)
					pos = 0
					begin
						$bot.set_user_permission(permarray[pos],permarray[pos+1])
						pos += 3
					end while pos < permarray.length
					puts "Permission Loaded!"
				else
					if uname == "check"
						event.respond permarray
					else
						event.respond "Invalid user."
					end
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: botmod"
				nil
			end
		end
	end
end
