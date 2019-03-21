require_relative "./game"
class Board
  
  attr_accessor :boxes

  def initialize
    @boxes = {a1: 'X', a2: 'X', a3: 'X', 
              b1: 'X', b2: 'X', b3: 'X', 
              c1: 'X', c2: 'X', c3: 'X'}
    
    @board = "|#{@boxes[:a1]}|#{@boxes[:a2]}|#{@boxes[:a3]}|
|#{@boxes[:b1]}|#{@boxes[:b2]}|#{@boxes[:b3]}|
|#{@boxes[:c1]}|#{@boxes[:c2]}|#{@boxes[:c3]}|"

  end

  def load_board
    puts @board
  end

  def update_board arg, mark
    case arg
    when 1 then @boxes[a1 = mark]
    when 2 then @boxes[a2 = mark]
    when 3 then @boxes[a3 = mark]
    when 4 then @boxes[b1 = mark]
    when 5 then @boxes[b2 = mark]
    when 6 then @boxes[b3 = mark]
    when 7 then @boxes[c1 = mark]
    when 8 then @boxes[c2 = mark]
    when 9 then @boxes[c3 = mark]
    else "Un-existent Box"
    end

  end
 
end
