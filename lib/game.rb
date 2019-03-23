require_relative './requirements'

# Game class
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(name1, mark1, name2, mark2)
    @board = Board.new
    @player_1 = Player.new(name1, mark1, false)
    @player_2 = Player.new(name2, mark2, false)
  end

  def turns
    puts ''
    puts ''
    @board.load_board
    puts ''
    puts "#{@player_1.name} goes first, make your move"
    puts ''
    @player_1.move(player_1, @board)
    counter = 1

    size_validator = Proc.new { |i, j| i + j > 7 }

    check_out = proc { |player|
        winner_is = player.name
        puts "\nThe winner is #{winner_is}"
        puts "#{@board.load_board}\n===== Game Over =====\n\n"
    }

    stop = false
    until @player_1.winner || @player_2.winner || stop
      
      # PLAYER 2
      make_your_move(@player_2, @board)
      counter += 1
      checker2 = check_winner(@player_2) if counter > 4
      return check_out.call(@Player_2) if checker2
      
      # PLAYER 1
      make_your_move(@player_1, @board)
      counter += 1
      checker1 = check_winner(@player_1) if counter > 4
      return check_out.call(@player_1) if checker1

      stop = size_validator.call(@player_1.places.size, @player_2.places.size)

      return "Draw, try again!\n===== Game Over =====\n\n" if stop
    end
  end

  def make_your_move(player, board)
    puts ''
    @board.load_board
    puts "\n#{player.name} make your move\n"
    player.move(player, board)
  end

  def check_winner(player)
    out = if (player.places & [1, 2, 3]).size == 3
            true
          elsif (player.places & [4, 5, 6]).size == 3
            true
          elsif (player.places & [7, 8, 9]).size == 3
            true
          elsif (player.places & [1, 4, 7]).size == 3
            true
          elsif (player.places & [2, 5, 8]).size == 3
            true
          elsif (player.places & [3, 6, 9]).size == 3
            true
          elsif (player.places & [1, 5, 9]).size == 3
            true
          elsif (player.places & [3, 5, 7]).size == 3
            true
          else false
          end
    player.winner = true if out
    out
  end
end
