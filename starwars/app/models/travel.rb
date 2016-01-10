class Travel

	attr_accessor :name_specie, :passengers, :total

	def initialize(name)
		@name_specie = name
		@total = 0
		@passengers = []
	end

	def add(people)
		@passengers.push(people)
		@total = people.mass.to_i < 101 ? @total + 1 : @total + 2
	end	

	def has_place(people)
		need_place = 0
		if people.mass.to_i < 101
			need_place = 1
		else
			need_place = 2
		end 

		return (need_place + total) < 5

	end

end