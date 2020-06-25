class Tower
    attr_reader :value
    def initialize(value=nil)
        value ||= [[1,2,3],[],[]]

        @value = value
    end

    def move(pile_idx_1, pile_idx_2)
        pile_1 = self.value[pile_idx_1]
        pile_2 = self.value[pile_idx_2]
        
        if !pile_1.empty? && !pile_2.empty? && pile_1.first > pile_2.first
            raise "The space is occupied by a smaller piece"
        end
        piece = pile_1.shift
        pile_2.unshift(piece)
        return self.value
    end

    def won? 
        if self.value == [[], [], [1,2,3]]
            puts "You won!"
            return true
        end
        false
    end

end