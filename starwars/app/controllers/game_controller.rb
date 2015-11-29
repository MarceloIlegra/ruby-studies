class GameController < ApplicationController
  
  def index

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
  	render json: @all_characters
  end

end
