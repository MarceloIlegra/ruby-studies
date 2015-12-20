class Person

	attr_reader :url_people, :name, :birth_year, :url_specie, :is_older, :mass
	attr_writer :url_people, :name, :birth_year, :url_specie, :is_older, :mass
	
	def initialize()
		@is_older = is_older
	end

end