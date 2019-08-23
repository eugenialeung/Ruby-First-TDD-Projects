require 'array'

describe "my_uniq" do
    let(:arr) { [1, 3, 4, 1, 3, 7] }
    let(:uniqued_arr) { my_uniq(arr.dup) }

    it "removes duplicates" do
        arr.each do |item|
            expect(uniqued_arr.count(item)).to eq(1)
        end
    end

    it "only contains items from original array" do
        uniqued_arr.each do |item|
          expect(arr).to include(item)
        end
    end

    it "does not modify the original array" do
        expect {
            my_uniq(arr)
    }.to_not change{arr}
    end
end


describe "two_sum" do
    let(:array) { [-5, -3, 1, 3] }
    let(:one_zero) { [3, 0, 4] }
    let(:two_zeros) { [3, 0, 4, 0] }

    it "finds a zero-sum pair" do 
        expect(two_sum(array)).to eq([[1, 3]])
    end

    it "is not confused by a single zero" do
        # naively running `include?(-1 * item)` for each `item` will
        # fail. This was a mistake I made, so I added a test for it.
        # Always add a test when you find a bug :-)
        expect(two_sum(one_zero)).to eq([])
    end

    it "handles two zeros" do 
        expect(two_sum(two_zeros)).to eq([[1, 3]])
    end

end


describe "my_transpose" do
    it "transposes a matrix" do
        matrix = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]

    expect(my_transpose(matrix)).to eq([
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9]
    ])
    end
end

describe "pick_stocks" do
    it "finds a simple pair" do
      expect(pick_stocks([3, 1, 0, 4, 6, 9])).to eq([2, 5])
    end
  
    it "finds a better pair after an inferior pair" do
      expect(pick_stocks([3, 2, 5, 0, 6])).to eq([3, 4])
    end
  
    it "does not buy stocks in a crash" do
      expect(pick_stocks([5, 4, 3, 2, 1])).to be_nil
    end
end