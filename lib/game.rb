require_relative './req'

# Game Class
class Game
  attr_accessor :player_1, :player_2, :win1, :win2, :tie
  include Messenger

  def initialize(name1, mark1, name2, mark2)
    @moves_counter = 0
    @win1 = 0
    @win2 = 0
    @tie = 0
    @player1 = Player.new(name1, mark1)
    @player2 = Player.new(name2, mark2)
    @board = Board.new(name1, name2)
  end

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

  # PROCS

  $tie_validation = proc { |board|
    board.set_scores('tie', board.tie_score += 1)
    board.load_board
    true
  }

  $check_out = proc { |player, board|
    winner_is = player.name
    board.set_scores(winner_is, player.score += 1)
    board.load_board
  }

  $winning = proc { |player|
    winner = "#{player.name} [#{player.mark}]"
    centerSize = (31 - winner.size) / 2
    spaces = centerSize > 0 ? ' '* centerSize : ''
    puts "    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n
    #{spaces+winner}\n
    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n\n\n"
  }

  def movement_and_check(player, board)
    auth_finish = false
    board.load_board
    puts "\n    #{player.name} [#{player.mark}] goes first, make your move\n" if @moves_counter.zero?
    make_your_move(player, board)
    @moves_counter += 1
    win_chk = check_winner(player) if @moves_counter > 4

    tie = $tie_validation.call(board) if @moves_counter == 9 && !win_chk
    if win_chk || tie
      $check_out.call(player, board) if win_chk
      if tie
        puts "    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n
            TIE, TRY AGAIN!\n
    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n\n\n"
      end
      $winning.call(player) if win_chk
      print '    Press [Enter] NEXT GAME or [Q] to Quit: '
      salida = false
      until salida 
        q = gets.chomp.upcase
        if q == 'Q'
          salida = true
          clean_sys
          puts "\nDeveloped in Ruby by: @st_iakov & @miss_elliev - 2019\n\n"
          return auth_finish = true
        elsif q.empty?
          salida = true
          puts "test"
          clean_for_new_game if auth_finish == false
        else
          print '    Please only type [Q] to quit or press [Enter] for a new game: '
        end
      end
      auth_finish
    end
  end

  def make_your_move(player, board)
    puts "\n    #{player.name} [#{player.mark}] make your move\n" if @moves_counter > 0
    player.move(player, board)
  end

  def check_winner(player)
    out = false
    streaks = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
               [1, 4, 7], [2, 5, 8], [3, 6, 9],
               [1, 5, 9], [3, 5, 7]]
    streaks.each { |set| out = true if (player.places & set).size == 3 }
    out
  end

  def clean_for_new_game
    @player1.places.clear
    @player2.places.clear
    @board.used_cells = []
    @moves_counter = 0
    @board.clean_board
  end
end
