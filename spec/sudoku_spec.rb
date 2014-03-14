require_relative "../lib/cell"
require_relative "../lib/grid"

describe Grid do

	context "initialization" do 

		let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
		let(:grid) { Grid.new(puzzle) }

		it "should have 81 cells" do
			expect(grid.cells.count).to eq(81)
		end

		it "should have an unsolved first cell" do 
			expect(grid.cells[0]).to eq("0")
		end

		it "should have a solved second cell with value 1" do
			expect(grid.cells[1]).to eq("1")
		end
	end

	context "solving sudoku" do

		let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
		let(:grid) { Grid.new(puzzle) }

		it "should split the puzzle into 9 rows of 9" do
			grid.create_rows_and_columns
			expect(grid.rows_array[0]).to eq(['0','1','5','0','0','3','0','0','2'])
		end

		it "should transpose the rows to solve columns" do
			grid.create_rows_and_columns
			expect(grid.columns_array[0]).to eq(['0','0','2','4','5','0','9','8','0'])
		end

		it "should show all neighbours in each 3x3 box" do
			grid.create_rows_and_columns
			grid.create_box
			expect(grid.box_array[0]).to eq(["0", "0", "2", "1", "0", "7", "5", "0", "0"])
		end

		it "should produce an array of neighbours of given cell" do
			grid.create_rows_and_columns
			grid.create_box
			grid.try_to_solve
			expect(grid.neighbours).to eq(['2','3','4','5','6','7'])
		end
	end

	context "for a solved sudoku" do

		let(:puzzle) { '615493872348127956279568431496832517521746389783915264952681743864379125137254698' }
		let(:grid) { Grid.new(puzzle) }

		it "should recognise that the grid is complete" do
			expect(grid.solved?).to be_true
		end
	end
end