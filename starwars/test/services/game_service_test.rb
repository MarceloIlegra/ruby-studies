require 'test_helper'

class GameServiceTest < ActiveSupport::TestCase

	test "organize_travel_success" do
		load_registration_service

		specie_a = Group.new("1")
		person_1 = Person.new
		person_1.name = "A"
		person_1.birth_year = "19BBY"
		person_1.mass="77"
		specie_a.add(person_1)

		person_2 = Person.new
		person_2.name = "B"
		person_2.birth_year = "30BBY"
		person_2.mass="120"
		specie_a.add(person_2)

		person_3 = Person.new
		person_3.name = "C"
		person_3.birth_year = "12ABY"
		person_3.mass="100"
		specie_a.add(person_3)

		person_4 = Person.new
		person_4.name = "D"
		person_4.birth_year = "35ABY"
		person_4.mass="100"
		specie_a.add(person_4)

		specie_b = Group.new("b")

		person_5 = Person.new
		person_5.name = "E"
		person_5.birth_year = "35ABY"
		person_5.mass="150"
		specie_b.add(person_5)	

		person_6 = Person.new
		person_6.name = "E"
		person_6.birth_year = "77BBY"
		person_6.mass="180"
		specie_b.add(person_6)		


		specie_c = Group.new("c")

		person_6 = Person.new
		person_6.name = "F"
		person_6.birth_year = "10ABY"
		person_6.mass="150"
		specie_b.add(person_6)	

		person_7 = Person.new
		person_7.name = "G"
		person_7.birth_year = "77BBY"
		person_7.mass="100"
		specie_c.add(person_7)

		travels = @game_service.organize_travel ([specie_a, specie_b, specie_c])
		
		assert travels[0].name_specie.eql? "older_people"
		assert travels[0].passengers[0].name.eql? "B"
		assert travels[0].passengers[1].name.eql? "E"
		assert travels[0].passengers.length == 2
		
		assert travels[1].name_specie.eql? "older_people"
		assert travels[1].passengers.length == 1
		assert travels[1].passengers[0].name.eql? "G"

		assert travels.length == 5

	end

	test "get_older_people_each_specie_success" do
		load_registration_service

		specie_a = Group.new("1")
		person_1 = Person.new
		person_1.name = "A"
		person_1.birth_year = "19BBY"
		specie_a.add(person_1)

		person_2 = Person.new
		person_2.name = "B"
		person_2.birth_year = "30BBY"
		specie_a.add(person_2)

		person_3 = Person.new
		person_3.name = "C"
		person_3.birth_year = "12ABY"
		specie_a.add(person_3)

		person_4 = Person.new
		person_4.name = "D"
		person_4.birth_year = "35ABY"
		specie_a.add(person_4)

		specie_b = Group.new("b")

		person_5 = Person.new
		person_5.name = "E"
		person_5.birth_year = "35ABY"
		specie_b.add(person_5)	

		person_6 = Person.new
		person_6.name = "E"
		person_6.birth_year = "77BBY"
		specie_b.add(person_6)	

		older_people = @game_service.mark_the_older_people_each_specie([specie_a,specie_b])
		assert older_people[0].person[1].is_older
		assert older_people[1].person[1].is_older
	end

	test "is_older_comparing_two_eras" do
		load_registration_service
		assert @game_service.is_older("15ABY", "20ABY")
		assert @game_service.is_older("15ABY", "15ABY")
		assert @game_service.is_older("85ABY", "20ABY") == false
		assert @game_service.is_older("80BBY", "15BBY")
		assert @game_service.is_older("50BBY", "50BBY")
		assert @game_service.is_older("80BBY", "90BBY") == false
		assert @game_service.is_older("20ABY", "20BBY") == false
		assert @game_service.is_older("80ABY", "20BBY") == false
		assert @game_service.is_older("80BBY", "20ABY") 
	end

	test "is_older_and_nil_values" do
		load_registration_service
		assert @game_service.is_older(nil, "1ABY") == false
		assert @game_service.is_older("1ABY", nil)
	end

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