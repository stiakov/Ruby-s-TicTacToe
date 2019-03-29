require_relative './req'

# Game Class
class Game
  attr_accessor :player_1, :player_2
  include Messenger

  def initialize(name1, mark1, name2, mark2)
    @moves_counter = 0
    @player1 = Player.new(name1, mark1)
    @player2 = Player.new(name2, mark2)
    @board = Board.new(name1, name2)
    turns
  end

  private

  def turns
    @board.load_board

    sort = [0, 1].sample

    first = sort.zero? ? @player1 : @player2
    second = sort.zero? ? @player2 : @player1

    finish = false
    until finish
      # FIRST PLAYER
      finish = movement_and_check(first, @board)
      next if finish

      # SECOND PLAYER
      finish = movement_and_check(second, @board)
    end
  end

  def tie_update(board, winner)
    out = false
    if @moves_counter == 9 && !winner
      board.set_scores('tie', board.tie_score += 1)
      board.load_board
      puts "    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n
            TIE, TRY AGAIN!\n
    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n\n\n"
      out = true
    end
    out
  end

  def winner_update(player, board)
    out = false
    if @moves_counter > 4
      streaks = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
      streaks.each { |set| out = true if (player.places & set).size == 3 }
    end
    if out
      board.set_scores(player.name, player.score += 1)
      board.load_board
      winner = "#{player.name} [#{player.mark}]"
      center_size = (26 - winner.size) / 2
      spaces = center_size > 0 ? ' ' * center_size : ''
      puts "    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n
    #{spaces + winner} WINS!\n
    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n\n\n"
    end
    out
  end

  def movement_and_check(player, board)
    make_your_move(player, board)

    win_chk = winner_update(player, board)
    tie_chk = tie_update(board, win_chk)

    new_game? if win_chk || tie_chk
  end

  def new_game?
    out = false
    print '    Press [Enter] to PLAY AGAIN or [Q] to Quit: '
    until out
      q = gets.chomp.upcase
      if q == 'Q'
        out = true
        clean_sys
        puts "\nDeveloped in Ruby by: @st_iakov & @miss_elliev - 2019\n\n"
        break
      elsif q.empty?
        clean_for_new_game
        break
      else
        print '    Please only type [Q] to quit or press [Enter] for a new game: '
      end
    end
    out
  end

  def make_your_move(player, board)
    board.load_board
    puts "\n    #{player.name} [#{player.mark}] goes first, make your move\n" if @moves_counter.zero?
    puts "\n    #{player.name} [#{player.mark}] make your move\n" if @moves_counter > 0
    player.move(player, board)
    @moves_counter += 1
  end

  def clean_for_new_game
    @player1.places.clear
    @player2.places.clear
    @board.used_cells = []
    @moves_counter = 0
    @board.clean_board
  end
end
