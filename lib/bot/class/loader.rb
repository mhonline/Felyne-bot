def loadArr(ar,loc)
	if File.exist?(loc)
		f = File.open(loc,"r")
	else
		puts "No file #{loc} to load!"
	end
	buff = f.read
	begin
		ar=JSON.parse(buff)
	rescue
		puts "JSON Error! Deleting file!"
		File.delete(loc)
	end
	puts 'Array loaded!'
	return ar
end

def loadJSON(ar, loc)
	if File.exist?(loc)
		JSON.parse File.read loc
	else
		puts "No file #{loc} to load!"
	end
	return ar
end

def loadPerm(ar,loc)
	if File.exist?(loc)
		f = File.open(loc,"r")
	else
		puts "You have not set up any permissions", "Please enter your user id to set admin permissions for your discord account", "> "
		perm = [$stdin.gets.chomp.to_i,999,"botadmin"]
		File.write(loc, perm.to_s)
		puts "Permissions saved!"
		f = File.open(loc,"r")
	end
	buff = f.read
	begin
		ar=JSON.parse(buff)
	rescue
		puts "JSON Error! Deleting file!"
		File.delete(loc)
	end
	puts 'Array loaded!'
	return ar
end

#Load object arrays
def loadObj(ar,loc)
	if File.exist?(loc)
		f = File.open(loc,"r")
		ar=YAML.load(f)
		puts "Loaded #{loc}"
		f.close
	else
		puts "No file #{loc} to load!"
	end
end
#save object arrays
def saveObj(ar,loc)
	ar.sort! { |a,b| a.name.downcase <=> b.name.downcase }
	if File.exist?(loc) then File.open(loc, 'w') {|f| f.write(YAML.dump(ar)) }
	else File.open(loc, 'w') {|f| f.write(YAML.dump(ar)) } end
end

def saveGuilds(ar,loc)
	ar.sort! { |a,b| a.guild_name.downcase <=> b.guild_name.downcase }
	if File.exist?(loc) then File.open(loc, 'w') {|f| f.write(YAML.dump(ar)) }
	else File.new(loc, 'w') {|f| f.write(YAML.dump(ar)) } end
end

def loadmess(loc)
	if File.exist?(loc)
		f = File.open(loc,"r")
		$mess = YAML.load(f)
		puts 'Mess database Loaded!'
		f.close
	else
		puts 'No file to open!'
	end
end

def loadusers(loc)
	if File.exist?(loc)
		f = File.open(loc,"r")
		$users=YAML.load(f)
		puts 'User database Loaded!'
		f.close
	else
		puts 'No file to open!'
	end
end

def loadguilds(loc)
	if File.exist?(loc)
		f = File.open(loc,"r")
		$guilds = YAML.load(f)
		puts 'Guild database Loaded!'
		f.close
	else
		puts 'No file to open!'
	end
end

def getline(loc,line)
	if File.exist?(loc)
		f = File.open(loc,"r")
		line.times{ f.gets }
		$temp = $_
		f.close
		$temp
	else
		puts 'No file to open!'
	end
end