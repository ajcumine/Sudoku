class Cell

	attr_accessor :value
	attr_reader :neighbours

	def initialize(value, neighbours)
		@value = value.to_i
		@neighbours = neighbours
	end

	def filled_in?
		@value != 0
	end
	
	def possible_candidates
		@candidates = (1..9).to_a
		@candidates = @candidates.reject{|i| neighbours.include?(i)}
	end

	def solve
		possible_candidates
		@value = @candidates.pop.to_s if @candidates.length == 1
		# needs to create and store an array of all possible 
		# options probably?
		# but should not fill in the cell
	end
end