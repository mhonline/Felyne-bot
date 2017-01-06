class Raid
	def initialize(id, array, n, t)
		@channel = id
		@name = n
		@time = t
		
		array.push("#{@channel}": { "raid": [ { "name": @name, "time": @time } ] })
	end
end