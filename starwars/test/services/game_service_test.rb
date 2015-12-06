require 'test_helper'

class GameServiceTest < ActiveSupport::TestCase

	test "get_by_id return the correct person" do
		load_registration_service
		@person = @game_service.get_by_id 2
		assert "C-3PO".eql? "C-3PO"
	end

	test "get_all_by_list_id get correct people" do
		load_registration_service
		@people = @game_service.get_all_by_list_id [1,2,5]
		assert @people.length == 3
	end

	def load_registration_service(service = GameService.new)
		@game_service ||= service
	end

end