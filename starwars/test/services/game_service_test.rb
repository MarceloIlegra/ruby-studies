require 'test_helper'

class GameServiceTest < ActiveSupport::TestCase

	test "get_by_id return the correct person" do
		load_registration_service
		@person = @game_service.get_by_id 2
		assert @person != nil
		##puts @person
		##assert "C-3PO".eql? "C-3PO"
	end

	def load_registration_service(service = GameService.new)
		@game_service ||= service
	end

end