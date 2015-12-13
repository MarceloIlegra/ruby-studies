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

	test "discovery_clones_test_success" do
		load_registration_service
		person1 = Person.new
		person1.url_people = "http://swapi.co/api/species/1/"

		person2 = Person.new
		person2.url_people = "http://swapi.co/api/species/1/"
		
		characteres_list = [person1, person2]
		@groups_with_clones = @game_service.discovery_clone(characteres_list)
		 
	    assert @groups_with_clones[0].is_clone == false
	    assert @groups_with_clones[1].is_clone == true

	end

	def load_registration_service()
		@apiStarWarsFacade = ApiStarWarsFacade.new
		@game_service = GameService.new
	end

end