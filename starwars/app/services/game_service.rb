class GameService

	public

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

	def get_by_id (id)
		url = 'http://swapi.co/api/people/' << id.to_s		
  		return HTTParty.get(url) 		
	end

end