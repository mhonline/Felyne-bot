class Raid
	def initialize(id, ar, n, t)
		@channel = id
		@array = ar
		@name = n
		@time = t
		
		array.push(self)
	end
end