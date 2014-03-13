require_relative "../lib/cell"
require_relative "../lib/grid"

describe Cell do
	let(:cell) { Cell.new('1') }

	it "should initalize with a value" do
		expect(cell.value).to eq(1)
	end

	it "should return true when filled in" do
		expect(cell.filled_in?).to be_true
	end

	# it "should list the possible candidates for unsolved cells" do
	# 	cell.filled_in? = false
	# 	expect()
	# end
end