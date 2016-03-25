require 'enumerables.rb'

describe "#unique" do

  let(:arr) {[1,2,3]}
  let(:arr_duplicates) {[1,1,1,2,2,3]}

  it "returns the same array" do
    expect(arr.unique).to eq(arr)
  end

  it "returns empty array from an empty array" do
    expect([].unique).to eq([])
  end

  it "returns an array with no duplicate elements" do
    expect(arr_duplicates.unique).to eq([1,2,3])
  end
end

describe "#two_sum" do

  let(:arr) {[-1, 0, 2, -2, 1]}
  let(:order_arr) {[2, 2, -2, 1]}
  let(:order_arr2) {[1, -1, -1]}
  let(:empty) {[]}

  it "returns an empty array for an empty arry" do
    expect(empty.two_sum).to eq([])
  end

  it "returns an array of index pairs that sum to 0" do
    expect(arr.two_sum).to eq([[0, 4], [2, 3]])
  end

  it "returns an array with smaller first elements coming first" do
    expect(order_arr.two_sum).to eq([[0, 2], [1, 2]])
  end

  it "returns an array with smaller second elements coming first" do
    expect(order_arr2.two_sum).to eq([[0, 1], [0, 2]])
  end
end

describe "#my_transpose" do

  let(:rows) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  let(:cols) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]}

  it "returns transposed array" do
    expect(rows.my_transpose).to eq(cols)
  end

  it "returns an empty array for a empty array" do
    expect([].my_transpose).to eq([])
  end

end

describe "#stock_picker" do
  let(:stocks) {[25, 30, 32, 22]}
  let(:losing_stock) {[25, 20, 15, 10]}
  let(:stocks_2) {[25, 28, 21, 32, 34]}
  it "returns most profitable pair of days" do
    expect(stocks.stock_picker).to eq([0, 2])
  end

  it "returns nil for empty array" do
    expect([].stock_picker).to eq(nil)
  end

  it "returns empty array for nonprofitable stocks" do
    expect(losing_stock.stock_picker).to eq([])
  end

  it "returns pair thats not start date" do
    expect(stocks_2.stock_picker).to eq([2, 4])
  end
end
