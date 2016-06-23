class User
	def initialize(id, name, ign, array, channel, b)
		@usr_id=id
		@usr_name=name
		@usr_ign=ign
		@usr_guild=nil
		@user_timezone=nil
		@user_server=nil

		if array.empty?
			array.push(self)
			b.send_message(channel, "**#{name}** not found in (empty) database, added. IGN: **#{ign}**")
		else
			if array.any?{|a| a.id == id}
				b.send_message(channel, "**#{name}** found in database, skipped.")
			else
				array.push(self)
				b.send_message(channel, "**#{name}** not found in database, added. IGN: **#{ign}**")
			end
		end
	end

	def addName(name="")
		@usr_name=name
	end

	def addIgn(ign="")
		@usr_ign=ign
	end

	def addGuild(guild=nil)
		@usr_guild=guild
	end

	def addTimezone(zone=nil)
		@usr_timezone=zone
	end

	def addServer(zone=nil)
		@usr_server=zone
	end

#Defining the user id variable (call it with user.id)
	def id
		@usr_id
	end
#Defining the user name variable (call it with user.name)
	def name
		@usr_name
	end
#Defining the user ign variable (call it with user.ign)
	def ign
		@usr_ign
	end
#Defining the user guild variable (call it with user.guild)
	def guild
		@usr_guild
	end
#Defining the user id variable (call it with user.timezone)
	def timezone
		@usr_timezone
	end
#Defining the user id variable (call it with user.server)
	def server
		@usr_server
	end
end