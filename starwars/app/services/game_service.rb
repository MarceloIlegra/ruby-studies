class GameService

	public

	def group_by_species (list_person)
		@groups = []
		list_person.each { |x|
			specie = x["species"]			
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