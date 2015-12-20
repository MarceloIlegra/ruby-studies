class Travel

	attr_accessor :name_specie, :passengers

	def initialize(name)
		@name_specie = name
		@passengers = []
	end

	def add(people)
		@passengers.push(people)
	end	

end