require_relative "../lib/cell"
require_relative "../lib/grid"

describe Cell do
	let(:cell) { Cell.new('1') }

	it "should initalize with a value" do
		expect(cell.value).to eq(1)
	end
end