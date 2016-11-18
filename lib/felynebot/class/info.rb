def prompt(*args)
	print(*args)
	gets
end

class Info
	def initialize(loc1,loc2) #loc3
		@i_id = nil #i_cid
		@i_token = nil
#		@i_aid=nil


	#Open file for Client ID/Get ID
		if File.exist?(loc1)
			f = File.open(loc1,"r")
			token = f.read
			@i_token = token
			f.close
			puts "Token Loaded!"
		else
			puts 'No file found for the Token String! Please input your token.'
			token = prompt "Token: "
			@i_token = token
			q = prompt "Store this for next time? y/n: "
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

	#Open file for Client ID/Get ID
	if File.exist?(loc2)
		f = File.open(loc2,"r")
		id = f.read #cid = f.read
		@i_id = id #i_cid = cid
		f.close
		puts "Client ID Loaded!"
	else
		puts 'No file found for the ID String! Please input the ID.'
		id = prompt "Client/Client ID: " #cid = prompt "Client/Client ID:"
		@i_id = id #i_cid = cid

		q= prompt "Store this for next time? y/n: "
		if q[0] == "y"
			if File.exist?(loc2)
				f = File.open(loc2,"w")
			else
				puts "Creating new file [#{loc2}]"
				f = File.new(loc2,"w")
			end
				f.write(id) #f.write(cid)
				f.close
			end
		end
	end	

	#Open file for Application ID/Get ID
#	if File.exist?(loc3)
#		f = File.open(loc3,"r")
#		aid = f.read
#		@i_aid = aid
#		f.close
#		puts "Application ID Loaded!"
#	else
#		puts 'No file found for the ID String! Please input the ID.'
#		aid = prompt "Aplication/Application ID: "
#		@i_aid = aid
#
#		q = prompt "Store this for next time? y/n: "
#		if q[0] == "y"
#			if File.exist?(loc3)
#				f = File.open(loc3,"w")
#			else
#				puts "Creating new file [#{loc3}]"
#				f = File.new(loc3,"w")
#			end
#				f.write(aid)
#				f.close
#			end
#		end
#	end


	def id #cid
		@i_id #@i_cid
	end
	
#	def aid
#		@i_aid
#	end
	
	def token
		@i_token
	end
end
