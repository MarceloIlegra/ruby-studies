require 'test_helper'

class GameServiceTest < ActiveSupport::TestCase

	test "grouping_by_species" do
		load_registration_service
		@people = @apiStarWarsFacade.get_all_by_list_id [1,2,3]
		@people_grouped = @game_service.group_by_species(@people)
		assert @people_grouped.length == 2
		assert @people_grouped[0].person.length == 1
		assert @people_grouped[1].person.length == 2
	end

	def load_registration_service()
		@apiStarWarsFacade = ApiStarWarsFacade.new
		@game_service = GameService.new
	end

end