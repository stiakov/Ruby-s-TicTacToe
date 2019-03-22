require_relative './requirements'

# Game class
class Game
  def initialize(name1, mark1, name2, mark2)
    @board = Board.new
    @player_1 = Player.new(name1, mark1, false)
    @player_2 = Player.new(name2, mark1, false)
  end
  first = rand(1)


  # until @p1.winner || @p2.winner

  # end
end

g = Game.new
