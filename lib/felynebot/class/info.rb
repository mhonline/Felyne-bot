def prompt(*args)
	print(*args)
	gets
end

class Info
	def initialize(loc1,loc2)
		@i_id=nil
		@i_token=nil

		if File.exist?(loc1)
			f = File.open(loc1,"r")
			token = f.read
			@i_token=token
			f.close
			puts "Token Loaded"
		else
			puts 'No file found for the Token String! Please input your token.'
			token = prompt "Token: "
			@i_token=token
			q= prompt "Store this for next time? y/n: "
		if q[0] == "y"
			if File.exist?(loc1)
				f = File.open(loc1,"w")
			else
				puts "Creating new file [#{loc1}]"
				f = File.new(loc1,"w")
			end
			f.write(token)
			f.close
		end
	end
#Open file for ID/Get ID
	if File.exist?(loc2)
		f = File.open(loc2,"r")
		id = f.read
		@i_id=id
		f.close
		puts "ID Loaded"
	else
		puts 'No file found for the ID String! Please input the ID.'
		id = prompt "Client/Client ID: "
		@i_id=id

		q= prompt "Store this for next time? y/n: "
		if q[0] == "y"
			if File.exist?(loc2)
				f = File.open(loc2,"w")
			else
				puts "Creating new file [#{loc2}]"
				f = File.new(loc2,"w")
			end
				f.write(id)
				f.close
			end
		end
	end

	def id
		@i_id
	end
#Defining the user name variable (call it with user.name)
	def token
		@i_token
	end
end