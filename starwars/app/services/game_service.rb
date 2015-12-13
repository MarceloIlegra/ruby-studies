class GameService

	public

	def group_by_species (list_person)
		@groups = []
		list_with_person = list_person #discovery_clone (list_person)
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

	def discovery_clone (list_characters)
		people = []
		list_with_clone = []
		list_characters.each{ |x|
			if people.index(x.url_people) != nil
				puts "encontrei"
			end 			
			x.is_clone = true
			people.push(x)
			list_with_clone.push(x)
		}
		list_with_clone.each{ |x| 
			if x.is_clone 
				puts "clone"
			else
				puts "nao eh clone"
			end
		}
		return list_with_clone
	end


end






