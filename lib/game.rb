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
    counter = 1
    @board.load_board

    puts "\n#{@player_1.name} [#{@player_1.mark}] goes first, make your move\n"
    @player_1.move(@player_1, @board)

    # PROC BLOCKS
    size_validator = proc { |i, j| i + j > 7 }

    check_out = proc { |player|
      winner_is = player.name
      puts "\nThe winner is #{winner_is} [#{player.mark}]"
      puts "#{@board.load_board}\n===== Game Over =====\n\n"
    }

    stop = false
    until @player_1.winner || @player_2.winner || stop

      # PLAYER 2
      make_your_move(@player_2, @board)
      counter += 1
      checker2 = check_winner(@player_2) if counter > 4
      return check_out.call(@player_2) if checker2

      # DRAW VALIDATION
      if size_validator.call(@player_1.places.size, @player_2.places.size)
        return "Draw, try again!\n===== Game Over =====\n\n"
      end

      # PLAYER 1
      make_your_move(@player_1, @board)
      counter += 1
      checker1 = check_winner(@player_1) if counter > 4
      return check_out.call(@player_1) if checker1
    end
  end

  def make_your_move(player, board)
    @board.load_board
    puts "\n#{player.name} [#{player.mark}] make your move\n"
    player.move(player, board)
  end

  def check_winner(player)
    out = false
    streaks = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
               [1, 4, 7], [2, 5, 8], [3, 6, 9],
               [1, 5, 9], [3, 5, 7]]
    streaks.each { |set| out = true if (player.places & set).size == 3 }
    player.winner = true if out
    out
  end
end
