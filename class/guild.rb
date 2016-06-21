class Guild
	def initialize(role, guildname, array, channel, b)
		@role=role
		@guild_name=guildname
		if array.empty?
			array.push(self)
			b.send_message(channel, "**#{guildname}** not found in (empty) database, added. Guild: **#{guildname}**")
		else
			if array.any?{|a| a.guildname == guildname}
				b.send_message(channel, "**#{guildname}** found in database, skipped.")
			else
				array.push(self)
				b.send_message(channel, "**#{guildname}** not found in database, added. Guild: **#{guildname}**")
			end
		end
	end
#Defining the guild role variable (call it with guild.role)
	def guild_role
		@guild_role
	end
#Defining the guild name variable (call it with guild.name)
	def name
		@guild_name
	end
end