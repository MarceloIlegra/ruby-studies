
class GameController < ApplicationController
  
  	def index
  		load_registration_service
  		render json: @game_service.get_all 	
  	end

  	def getone
  		load_registration_service
  		
  		render json: @game_service.get_by_id 2
  	end

	def load_registration_service(service = GameService.new)
		@game_service ||= service
	end

end
