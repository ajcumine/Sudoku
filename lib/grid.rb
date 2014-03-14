class Grid

	attr_reader :cells
	attr_reader :puzzle

	def initialize(puzzle)
		@cells = puzzle.split('')
	end

	
	def solve
		# accurately complete box of 9
		# accurately complete row of 9
		# accurately complete column of 9
	end

	def row_complete
		# array of 9 elements - find options/candidates for all '0' elements
		#fill in cells where there is only one option
	end

	def column_complete
		# TRANSPOSE ARRAY FOR ROWS probably
		# find options/candidates for all '0' elements
		# fill in cells where there is only one option
	end

	def box_complete
		# no idea how we'll do this
	end

	def solved?
		return false if cells.include?('0')
		true
	end

end