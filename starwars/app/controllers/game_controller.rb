
class GameController < ApplicationController
  
  	def index
  		load_registration_service
  		render json: @game_service.get_all 	
  	end

	def load_registration_service(service = GameService.new)
		@game_service ||= service
	end

end
