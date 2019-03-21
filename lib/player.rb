require_relative "game"
class Player
  attr_accessor :name, :mark, :score, :winner
  
  def initialize name, mark, score, winner
    @name = name
    @mark = mark
    @score = score
    @winner = winner
  end

  def move coor
    puts "Type a coordenade"
    puts input = gets.chomp
  end
end
