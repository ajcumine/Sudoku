class Grid

	attr_reader :cells
	attr_reader :puzzle
	attr_reader :rows_array
	attr_reader :columns_array
	attr_reader :box_array
	attr_reader :neighbours

	def initialize(puzzle)
		@cells = puzzle.split(//)
		@rows_array = []
		@box_array = []
		@neighbours = []
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

	def try_to_solve
		@cells.each_with_index do |value, index|
			i = @cells.index(value)
			row = i / 9
			column = i % 9
			row_neighbours = @rows_array[(i/9)/3]
			column_neighbours = @columns_array[(i%9)/3]
			box_neighbours = @box_array[(((i/9)/3) * 3) + ((i%9)/3)]
			@neighbours = (row_neighbours + column_neighbours + box_neighbours).uniq.sort
		end
	end

	def solved?
		return false if @cells.include?('0')
		true
	end
end