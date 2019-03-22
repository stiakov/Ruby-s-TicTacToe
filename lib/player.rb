class Player
  attr_accessor :name, :mark, :score, :winner, :places

  def initialize(name, mark, winner)
    @name = name
    @mark = mark
    @places = Array.new
    @winner = winner
  end

  def move(user, board)
    print 'Select position 1 to 9 if available: '
    puts input = gets.chomp
    check = check_position(board.board, input)
    unless check
      puts 'Invalid position, try another'
      puts 'Select position 1 to 9 if available'
      puts input = gets.chomp
      check = check_position(board, input)
    end
    @places.push(input)
    board.update_board(input, user.mark)
  end

  def check_position(board, position)
    out = if position == 1
            board[:a1] == '1'
          elsif position == 2
            board[:a2] == '2'
          elsif position == 3
            board[:a3] == '3'
          elsif position == 4
            board[:b1] == '4'
          elsif position == 5
            board[:b2] == '5'
          elsif position == 6
            board[:b3] == '6'
          elsif position == 7
            board[:c1] == '7'
          elsif position == 8
            board[:c2] == '8'
          elsif position == 9
            board[:c3] == '9'
          else false
          end
    out
  end
end
