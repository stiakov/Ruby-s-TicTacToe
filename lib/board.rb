require_relative "./game"
class Board
  
  attr_accessor :boxes

  def initialize
    @boxes = {a1: '1', a2: '2', a3: '3', 
              b1: '4', b2: '5', b3: '6', 
              c1: '7', c2: '8', c3: '9'}
    
    @board = "| #{@boxes[:a1]} | #{@boxes[:a2]} | #{@boxes[:a3]} |
| #{@boxes[:b1]} | #{@boxes[:b2]} | #{@boxes[:b3]} |
| #{@boxes[:c1]} | #{@boxes[:c2]} | #{@boxes[:c3]} |"

  end

  def load_board
    puts @board
  end

  def update_board box, mark
    case box
    when 1 then @boxes[:a1] = mark
    when 2 then @boxes[:a2] = mark
    when 3 then @boxes[:a3] = mark
    when 4 then @boxes[:b1] = mark
    when 5 then @boxes[:b2] = mark
    when 6 then @boxes[:b3] = mark
    when 7 then @boxes[:c1] = mark
    when 8 then @boxes[:c2] = mark
    when 9 then @boxes[:c3] = mark
    else "Un-existent Box"
    end
    @board = " -----------
| #{@boxes[:a1]} | #{@boxes[:a2]} | #{@boxes[:a3]} |
| #{@boxes[:b1]} | #{@boxes[:b2]} | #{@boxes[:b3]} |
| #{@boxes[:c1]} | #{@boxes[:c2]} | #{@boxes[:c3]} |
 -----------"

    @board
  end
end

a = Board.new
puts a.load_board
puts a.update_board(5, 'X')
puts a.update_board(3, 'O')
puts 'fin'