class Mess
	def initialize(id, name, time, mess, array)
		@usr_id=id
		@usr_name=name
		@usr_time=time
		@usr_mess=mess

		array.push(self)
	end

#Defining the id variable (call it with uMess.id)
	def id
		@usr_id
	end

	def s_id(var)
		@usr_id=var
	end
#Defining the name variable (call it with uMess.name)
	def name
		@usr_name
	end

	def s_name(var)
		@usr_name=var
	end
#Defining the time variable (call it with uMess.time)
	def time
		@usr_time
	end

	def s_time(var)
		@usr_time=var
	end
#Defining the message variable (call it with uMess.mess)
	def mess
		@usr_mess
	end

	def s_mess(var)
		@usr_mess=var
	end
end
