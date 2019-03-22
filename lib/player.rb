class Player
  attr_accessor :name, :mark, :score, :winner
  
  def initialize name, mark, score, winner
    @name = name
    @mark = mark
    @score = score
    @winner = winner
  end

  def move coor
    puts "Select position 1 to 9"
    puts input = gets.chomp
  end
end
