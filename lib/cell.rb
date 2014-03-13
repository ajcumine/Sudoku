class Cell

	attr_accessor :value

	def initialize(value)
		@value = value.to_i
	end

	def filled_in?
		@value != 0
	end
	
	def possible_candidates
		candidates = []
		if @value == 0
			#keep trying to find options for that cell
			#candidates << result
		end
	end

	def solve
	end
end