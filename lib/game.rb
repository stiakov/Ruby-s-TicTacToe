require_relative './requirements'

# Game class
class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(name1, mark1, name2, _mark2)
    @board = Board.new
    @player_1 = Player.new(name1, mark1, false)
    @player_2 = Player.new(name2, mark1, false)
  end

  def turns
    puts ''
    puts ''
    puts "#{@player_1.name} goes first, make your move"
    puts ''
    @board.load_board
    puts ''
    @player_1.move(player_1, @board)
    counter = 1
    validation = player_1.places.size + player_2.places.size == 8

    until @player_1.winner || @player_2.winner || validation
      puts ''
      puts "#{@player_2.name} make your move"
      puts ''
      @board.load_board
      puts ''

      @player_2.move(@player_2, @board)
      chk1 = check_winner(player_1.places, player_2.places) if counter > 4
      counter += 1

      puts ''
      puts "#{@player_1.name} make your move"
      puts ''
      @board.load_board
      puts ''

      @player_1.move(@player_1, @board)
      chk2 = check_winner(player_1.places, player_2.places) if counter > 4
      counter += 1

      if chk1 || chk2
        winner_is = chk1 ? @player_1.name : @player_2.name
        puts "The winner is #{winner_is}"
        puts @board.load_board
      end
    end
  end

  def check_winner(places1, places2)
    out = if places1.select { |i| i == 1 || i == 2 || i == 3 }.size == 3
          elsif places1.select { |i| i == 4 || i == 5 || i == 6 }.size == 3
          elsif places1.select { |i| i == 7 || i == 8 || i == 9 }.size == 3
          elsif places1.select { |i| i == 1 || i == 4 || i == 7 }.size == 3
          elsif places1.select { |i| i == 2 || i == 5 || i == 8 }.size == 3
          elsif places1.select { |i| i == 3 || i == 6 || i == 9 }.size == 3
          elsif places1.select { |i| i == 1 || i == 5 || i == 9 }.size == 3
          elsif places1.select { |i| i == 3 || i == 5 || i == 7 }.size == 3
          else false
          end
    out_2 = if places2.select { |i| i == 1 || i == 2 || i == 3 }.size == 3
            elsif places2.select { |i| i == 4 || i == 5 || i == 6 }.size == 3
            elsif places2.select { |i| i == 7 || i == 8 || i == 9 }.size == 3
            elsif places2.select { |i| i == 1 || i == 4 || i == 7 }.size == 3
            elsif places2.select { |i| i == 2 || i == 5 || i == 8 }.size == 3
            elsif places2.select { |i| i == 3 || i == 6 || i == 9 }.size == 3
            elsif places2.select { |i| i == 1 || i == 5 || i == 9 }.size == 3
            elsif places2.select { |i| i == 3 || i == 5 || i == 7 }.size == 3
            else false
          end
    out || out_2
  end
end
