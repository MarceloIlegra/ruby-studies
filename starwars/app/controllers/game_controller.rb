
class GameController < ApplicationController
  
  	def index
  		load_registration_service
      @people = @factory.get_all_by_list_id([1,2,3])
  		render json: @game_service.group_by_species(@people) 	
  	end

  	def getone
  		#load_registration_service  		
  		#render json: @game_service.get_by_id(2)
  	end

	def load_registration_service(service = GameService.new, factory = ApiStarWarsFacade.new)
		@game_service ||= service
    @factory ||= factory
	end

end
