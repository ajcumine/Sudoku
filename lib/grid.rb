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

	end

	def create_rows_and_columns
		9.times{@rows_array << @cells.shift(9)}
		@columns_array = @rows_array.transpose
	end

	def create_box
		box_calc2 = []
		box_calc = @columns_array.select{|i| i}
		3.times{box_calc.each{|i| box_calc2 << i.shift(3)}}
		9.times{@box_array << box_calc2.flatten.shift(9)}
	end

	def solved?
		return false if cells.include?('0')
		true
	end

end