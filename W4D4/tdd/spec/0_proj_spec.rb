require_relative '../lib/0_proj.rb'

describe "TDD Project" do
    let (:arr1) {[]}
    let (:arr2) {[1, 2, 3]}
    let (:arr3) {[1, 1, 2, 'j', 'elephant', 'j', :orange]}
    let (:arr4) {[-1, 0, 2, -2, 1]}
    let (:arr5) {[3, 2, 1]}
    let (:arr6) {[1, 1, 1]}
    let (:arr7) {[4, 7, 12, 17, 5, 3, 6]} #=> [[0, 3]]
    let (:arr8) {[4, 7, 12, 17, 4, 17]} #=>[[4, 5]]
    let (:arr9) {[3, 10, 2, 9, 7, 3]} #=>[[0, 1], [2, 3]]

    let (:grid1) { [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8]]}
    let (:grid2) {[
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8]]}

    describe "Array#my_uniq" do 
        context "when the array is empty" do
            it "should return an empty array" do
                expect(arr1.my_uniq).to be_empty 
            end
        end 
        context "when the array is filled with unique elements" do
            it "should return the original array" do 
                expect(arr2.my_uniq).to eq(arr2)
            end
        end
        context "when the array contains repeated elements" do
            it "should return unique element in the order appeared in the original array" do 
                expect(arr3.my_uniq).to eq([1, 2, 'j', 'elephant', :orange])
            end 
        end

    end

    describe "Array#two_sum" do
        context "when array is empty" do
            it "should return an empty array" do
                expect(arr1.two_sum).to be_empty
            end
        end
        context "when there are pairs that sum to zero" do
            it "should return the indices of the pairs that sum to zero" do
                expect(arr4.two_sum).to contain_exactly([0, 4], [2, 3])
            end

        end
        context "when there are no pairs that sum to zero" do
            it "should return an empty array" do
                expect(arr2.two_sum).to be_empty
            end
        end
    end

    describe "my_transpose" do 
        it "should return a transposed version of a 2D array where the rows are columns" do 
            expect(my_transpose(grid1)).to eq(grid2)
        end
    end
 
    describe "stock_picker" do
        context "if the input array has fewer than two elements" do
            it "should return an empty array" do
                expect(stock_picker(arr1)).to be_empty
            end
        end

        context "if the input array has at least two elements" do
            context "and the days are all losers for the stock"  do
                it "should return an empty array" do
                    expect(stock_picker(arr5)).to be_empty
                end
            end

            context "and the price never changes"  do
                it "should return an empty array" do
                    expect(stock_picker(arr6)).to be_empty
                end
            end

            context "there are profitable periods"  do
                context "there is one most profitable period" do
                    it "should return a 2D array with one pair representing the most profitable period"do
                        expect(stock_picker(arr7)).to eq([[0,3]])
                    end
                end

                context "there are multiple periods that yield the same profit" do
                    it "should return the shortest period of time" do 
                        expect(stock_picker(arr8)).to eq([[4,5]])
                    end
                end

                context "there are multiple pairs that yeild the same profit over the same time period" do
                    it "should return all of those pairs" do 
                        expect(stock_picker(arr9)).to eq([[0, 1], [2, 3]])
                    end
                end
            end
        end

       
    end
end