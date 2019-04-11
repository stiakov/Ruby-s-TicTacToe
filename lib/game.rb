require_relative "./req"
require_relative "./board.rb"
require_relative "./player.rb"
# Game Class
class Game
  include Messenger

  def initialize
    @choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @tie = 0
    @board = Board.new
  end

  def players
    data = ask_data
    @player1 = Player.new(data[:name1], data[:mark1]).to_hash
    @player2 = Player.new(data[:name2], data[:mark2]).to_hash
  end

  def turns
    moves = 0
    print @board.render_board(@player1, @player2, @tie, {})
   
    over = false
   
    until over
      player = moves.even? ? @player1 : @player2
      input = select_position
      if check_valid(input, @choices)
        player_move(@choices, player, input)
        win = winner(@choices, player[:mark])
        tie = tie(@choices)
        over = game_over(win,tie)
        moves += 1
        update_board = @board.update_board(input, player[:mark])
        print @board.render_board(@player1, @player2, @tie, update_board)
      else
        invalid
      end
     
      if win
        player[:score] += 1
        winner_message(player)
      end
      tie = tie(@choices)
      if tie
        @tie += 1
        draw
      end
    end
    new_game?
  end

  def tie(board)
    board.none? { |x| x.is_a?(Integer) }
  end

  def winner(board, sign)
    streaks = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]]
    streaks.each do |first, second, third|
      if board[first] == sign &&
         board[second] == sign &&
         board[third] == sign
        return true
      end
    end
    false
  end

  def new_game?
    out = false
    next_game
    until out
      q = gets.chomp.upcase
      if q == "Q"
        out = true
        clean_sys
        its_us
        break
      elsif q.empty?
        clean_for_new_game
        print @board.blank_board(@player1, @player2, @tie)
        turns
        break
      else
        next_game_warning
      end
    end
    out
  end

  def player_move(board, player, input)
    board[input - 1] = player[:mark]
  end

  def clean_for_new_game
    @choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def check_valid(input, board)
    print board
    Array(1..9).include?(input) && board[input - 1].is_a?(Integer)
  end

  def game_over(win, tie)
    win || tie
  end
end

a = Game.new
a.players
a.turns
