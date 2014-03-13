class Grid

	attr_reader :cells
	attr_reader :puzzle

	def initialize(puzzle)
		@cells = puzzle.split('')
	end

	
	def solve

	end

	def solved?
		return false if cells.include?('0')
		true
	end

end