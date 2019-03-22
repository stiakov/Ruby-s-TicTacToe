require_relative './requirements'

# Game class
class Game
  @@first = nil

  def initialize
    puts "Welcome to Tic Tac Toe's Match"
    puts ' '

    print 'Player 1: Type your alias: '
    name1 = gets.chomp
    print 'Player 2: Type your alias: '
    name2 = gets.chomp
    puts '---------------'
    @b = Board.new
    @p1 = Player.new(name1, 'X', 0, false)
    @p2 = Player.new(name2, 'O', 0, false)
    @@first = rand(1)
  end

  # until @p1.winner || @p2.winner

  # end
end

g = Game.new
