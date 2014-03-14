class Grid

	attr_reader :cells
	attr_reader :puzzle
	attr_reader :rows_array
	attr_reader :columns_array
	attr_reader :box_array

	def initialize(puzzle)
		@cells = puzzle.split(//)
		@rows_array = []
		@box_array = []
	end
	
	def solve
		outstanding_before, looping = SIZE, false
		while !solved? && !looping
			try_to_solve
			outstanding = @cells.count {|c| c.solved? }
			looping = outstanding_before == outstanding
			outstanding_before = outstanding
		end
	end

	def create_rows_and_columns
		9.times{@rows_array << @cells.shift(9)}
		@cells = @rows_array.flatten
		@columns_array = @rows_array.transpose
	end

	def create_box
		box_calc2 = []
		box_calc = @columns_array.select{|i| i}
		3.times{box_calc.each{|i| box_calc2 << i.shift(3)}}
		9.times{@box_array << box_calc2.flatten.shift(9)}
	end

	def list_neighbours
		i = @cells.#something
		while i == 0
			# lists row neighbours
			# lists column neighbours
			# lists box neighbours
			# returns them all in an array?
		end
	end

	def solved?
		return false if cells.include?('0')
		true
	end
end