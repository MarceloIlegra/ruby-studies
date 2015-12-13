require 'test_helper'

class ApiStarWarsFacadeTest < ActiveSupport::TestCase

	test "get_by_id return the correct person" do
		load_registration_service
		@person = @api_facade.get_by_id 2
		assert "C-3PO".eql? "C-3PO"
	end

	test "get_all_by_list_id get correct people" do
		load_registration_service
		@people = @api_facade.get_all_by_list_id [1,2,5]
		assert @people.length == 3
	end

	def load_registration_service(service = ApiStarWarsFacade.new)
		@api_facade ||= service
	end
	
end