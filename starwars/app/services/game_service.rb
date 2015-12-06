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
 		#url = 'http://swapi.co/api/people/'
		#list_id.each { |x| puts x }
 		return @all_characters		
	end

	def get_by_id (id)
		#url = 'http://swapi.co/api/people/' << id.to_s
		url = 'http://swapi.co/api/people/2'
 		@response = HTTParty.get(url)

 		return @response["results"]
 		
	end

end