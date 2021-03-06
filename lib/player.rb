require_relative './req'

# Player class
class Player < Game
  attr_accessor :name, :mark, :score, :places
  def initialize(name, mark)
    @name = name
    @mark = mark
    @places = []
    @score = 0
  end

  def move(user, board)
    print '    Select position [1] to [9] if available: '
    check = false

    until check
      input = gets.chomp.to_i
      check = check_valid(input, board)
    end

    @places << input.to_i
    board.update_board(input.to_s, user.mark)
  end

  def check_valid(input, board)
    valid_input = Array(1..9)
    out = !board.used_cells.include?(input) && valid_input.include?(input) ? true : false
    board.used_cells << input if out
    print "\n        Invalid position, try again!\n\n    Select position [1] to [9] if available: " unless out
    out
  end
end
