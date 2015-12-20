class ApiStarWarsFacade

	def get_by_id (id)
		url = 'http://swapi.co/api/people/' << id.to_s		
		@result = HTTParty.get(url) 
  		return map_to_person(@result, url)		
	end

	def map_to_person (result, url)
		person = Person.new
		person.url_people = url
		person.name = @result['name']
		person.url_specie = @result['species'][0]
		person.is_older = false
		person.mass = @result['mass']
		person.birth_year = @result['birth_year']
		


		return person
	end

	def get_all
		@all_characters = []
 		url = 'http://swapi.co/api/people/'
 		while true
 			@response = HTTParty.get(url)
 			@all_characters.concat(@response["results"])
 			if @response["next"] != nil
 				url = @response["next"]
 			else
 				break
 			end
 		end
 		return @all_characters
	end

	def get_all_by_list_id (list_id)
		@all_characters = []
		list_id.each { |x| 
			@all_characters.push(get_by_id(x))
		}
 		return @all_characters		
	end	




end