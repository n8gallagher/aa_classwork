require_relative '../lib/tower.rb'

describe "Towers of Hanoi" do 
    tower1 = Tower.new()
    tower2 = Tower.new([[2,3], [1], []])
    tower3 = Tower.new([[], [], [1,2,3]])
    
    describe "Tower#move" do 
        it "should take in a starting pile and an ending pile" do 
            expect{tower1.move(0, 1)}.to_not raise_error  
        end
        context "when the ending pile is occupied by a smaller piece" do
            it "should raise an error" do 
                expect{tower2.move(0, 1)}.to raise_error "The space is occupied by a smaller piece"
            end 
        end
        context "when the ending pile is empty" do 
            it "should move the top piece to the ending pile" do
                expect(tower2.move(0, 2)).to eq([[3],[1],[2]])
            end
        end
    end

    describe "Tower#won?" do 
        context "if the user win" do 
            it "should tell the user \"You won!\" if all pieces are stacked on the third pile" do 
                expect(tower3.won?).to be true 
            end
        end
        context "if the user did not win" do 
            it "should return false" do
                expect(tower2.won?).to be false 
            end
        end
    end

end