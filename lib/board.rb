# Board class
class Board
  attr_accessor :boxes

  def initialize
    @box = { a1: '1', a2: '2', a3: '3',
             b1: '4', b2: '5', b3: '6',
             c1: '7', c2: '8', c3: '9' }

    @board = "| #{@box[:a1]} | #{@box[:a2]} | #{@box[:a3]} |
| #{@box[:b1]} | #{@box[:b2]} | #{@box[:b3]} |
| #{@box[:c1]} | #{@box[:c2]} | #{@box[:c3]} |"
  end

  def load_board
    puts @board
  end

  def update_board(box, mark)
    case box
    when 1 then @box[:a1] = mark
    when 2 then @box[:a2] = mark
    when 3 then @box[:a3] = mark
    when 4 then @box[:b1] = mark
    when 5 then @box[:b2] = mark
    when 6 then @box[:b3] = mark
    when 7 then @box[:c1] = mark
    when 8 then @box[:c2] = mark
    when 9 then @box[:c3] = mark
    else 'Un-existent Box'
    end
    @board = " -----------
| #{@box[:a1]} | #{@box[:a2]} | #{@box[:a3]} |
| #{@box[:b1]} | #{@box[:b2]} | #{@box[:b3]} |
| #{@box[:c1]} | #{@box[:c2]} | #{@box[:c3]} |
 -----------"

    @board
  end
end

# a = Board.new
# puts a.load_board
# puts a.update_board(5, 'X')
# puts a.update_board(3, 'O')
# puts 'fin'
