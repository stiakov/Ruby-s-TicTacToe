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
    @places << input.to_i
    board.update_board(input.to_s, user.mark)
  end

  def check_position(board, position)
    out = case position
          when 1 then board[:a1] == '1'
          when 2 then board[:a2] == '2'
          when 3 then board[:a3] == '3'
          when 4 then board[:b1] == '4'
          when 5 then board[:b2] == '5'
          when 6 then board[:b3] == '6'
          when 7 then board[:c1] == '7'
          when 8 then board[:c2] == '8'
          when 9 then board[:c3] == '9'
          else false
          end
    out
  end
end
