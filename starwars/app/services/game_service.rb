class GameService

	public

	def organize_travel(list_groups_species)

		# array.delete_if { |v| v.should_be_deleted? }`

		list_groups_species = mark_the_older_people_each_specie(list_groups_species)
		travels = []
		#getting only older people
		travel = Travel.new("older_people")
		list_groups_species.each{|x|
			
			x.person.each{|y|
				if y.is_older
					travel.add(y)
				end
			}
			travels.push(travel)
		}
		return travels
	end


	def mark_the_older_people_each_specie(list_groups_species)
		list_groups_species.each{ |x| 
			position_older = 0
			last_birthday = nil
			x.person.each_with_index {|item, index|
				if is_older(item.birth_year, last_birthday)
					position_older = index
					last_birthday = item.birth_year
				end	
			}
			x.person[position_older].is_older = true
		}
		return list_groups_species
	end

	def is_older(first_birth_year, second_birth_year)

		if first_birth_year == nil
			return false
		end

		if second_birth_year ==  nil
			return true
		end

		year_1 = first_birth_year.gsub( /.{3}$/, '' )
		era_1 = first_birth_year.last(3)

		year_2 = second_birth_year.gsub( /.{3}$/, '' )
		era_2 = second_birth_year.last(3)

		if era_1.eql? era_2
			return year_1 > year_2
		else
			return era_1.eql? "BBY"
		end

		return false
	end

	def group_by_species (list_person)
		@groups = []
		list_with_person = list_person
		list_person.each { |x|
			specie = x.url_specie			
			if exists_specie(@groups, specie) == false
				@group = Group.new(specie)
				@group.add(x) 
				@groups.push(@group)
			else
				@groups.each{ |y| 
					if y.specie == specie
						y.add(x)
					end
				}
			end
		}
		return @groups
	end

	def exists_specie(groups, specie)
		groups.each{ |x| 
			if x.specie == specie
				return true
			end
		}
		return false
	end

end






