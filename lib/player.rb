class Player
  attr_accessor :name, :mark, :score, :winner

  def initialize(name, mark, winner)
    @name = name
    @mark = mark
    @places = places
    @winner = winner
  end

  def move(user, board)
    puts 'Select position 1 to 9 if available'
    puts input = gets.chomp
    check = check_position(board, input)
    unless check
      puts "Try another position"
      puts 'Select position 1 to 9 if available'
      puts input = gets.chomp
      check = check_position(board, input)
    end
    @places << input 
    update_board(input, user.mark)
  end

  def check_position(board, position)
    out = case position
          when 1 then board[:a1] == "1" ? true : false 
          when 2 then board[:a2] == "2" ? true : false 
          when 3 then board[:a3] == "3" ? true : false 
          when 4 then board[:b1] == "4" ? true : false 
          when 5 then board[:b2] == "5" ? true : false 
          when 6 then board[:b3] == "6" ? true : false 
          when 7 then board[:c1] == "7" ? true : false 
          when 8 then board[:c2] == "8" ? true : false 
          when 9 then board[:c3] == "9" ? true : false 
          else false
          end
    out
end
