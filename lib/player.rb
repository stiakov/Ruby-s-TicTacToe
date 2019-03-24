class Player
  attr_accessor :name, :mark, :score, :winner, :places

  def initialize(name, mark, winner)
    @name = name
    @mark = mark
    @places = []
    @winner = winner
  end

  def move(user, board)
    print 'Select position 1 to 9 if available: '
    input = gets.chomp.to_i

    check = check_position(board.box, input)
    until check
      print "Invalid position, try another,\nSelect position 1 to 9 if available"
      input = gets.chomp.to_i
      check = check_valid(input)
    end
    @places << input.to_i
    board.update_board(input.to_s, user.mark)
  end

  def check_valid(input)
    valid_input = Array(1..9)
    out = valid_input.include? input
    puts 'Please type ONLY numbers from 1 to 9. Try again' unless out
    out
  end

  def check_position(board, position)
    out = case position
          when 1 then board[:box_id_1] == 1
          when 2 then board[:box_id_2] == 2
          when 3 then board[:box_id_3] == 3
          when 4 then board[:box_id_4] == 4
          when 5 then board[:box_id_5] == 5
          when 6 then board[:box_id_6] == 6
          when 7 then board[:box_id_7] == 7
          when 8 then board[:box_id_8] == 8
          when 9 then board[:box_id_9] == 9
          else false
          end
    out
  end
end
