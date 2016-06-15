module FelyneBot
	module StoreData
		#Method for saving arrays
		def saveArr (ar,loc)
			if File.exist?(loc)
				f = File.open(loc,"w")
			else
				f = File.new(loc,"w")
			end
			f.write(ar.to_json)
			f.close
			puts "Saved File: [#{ar}] into [#{loc}]"

		end

		#Method for loading arrays
		def loadArr (ar,loc)
			if File.exist?(loc)
				#puts 'Opened file'
				f = File.open(loc,"r")
			else
				#puts 'No file!'
			end
			buff = f.read
			ar=JSON.parse(buff)
			#puts 'Loaded array!'
			return ar
		end

		#Load object arrays
		def loadObj (ar,loc)
			if File.exist?(loc)
		    f = File.open(loc,"r")
		    users=YAML.load(ar)
		    puts 'Loaded user database'
		    f.close
		  else
		    puts 'No file to load!'
		  end
		end

		#save object arrays
		def saveObj (ar,loc)
		  ar.sort! { |a,b| a.name.downcase <=> b.name.downcase }
			if File.exist?(loc) then File.open(loc, 'w') {|f| f.write(YAML.dump(ar)) }
			else File.new(loc, 'w') {|f| f.write(YAML.dump(ar)) } end
		end
	end
end