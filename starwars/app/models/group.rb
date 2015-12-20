class Group
	
	attr_reader :specie, :person
	attr_writer :specie, :person

	def initialize(specie)
		@specie = specie
		@person = []
	end

	def add (p)
		@person.push(p)
	end

end