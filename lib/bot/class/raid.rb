class Raid
	def initialize(id, array, n, t)
		@channel = id
		@name = n
		@time = t
		
		array.push(self)
	end
end