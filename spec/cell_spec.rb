require_relative "../lib/cell"
require_relative "../lib/grid"

describe Cell do

context "initialize" do

		let (:cell) do
			Cell.new("1", [1,3,6,7])
		end

		it "should initalize with a value" do
			expect(cell.value).to eq(1)
		end

		it "should return true when filled in" do
			expect(cell.filled_in?).to be_true
		end

		it "should have a list of neighbouring cells' values" do
			expect(cell.neighbours).to eq([1,3,6,7])
		end
	end

	context "if value is 0" do 

		let(:cell) {Cell.new('0',[1,2,3,4,5,6,7,8])}

		it "should not be filled in" do
			expect(cell.filled_in?).to be_false
		end

 		it "should list the possible candidates for unsolved cells" do
			expect(cell.possible_candidates).to eq([9])
		end

		it "should solve the value of the cell" do 
			cell.solve
			expect(cell.value).to eq("9")
		end 	
	end 
end