# Main class
require_relative './lib/Game'
class Main
  def initialize
    puts "Welcome to Tic Tac Toe's Match"
    puts ' '
    id = ask_ids
    Game.new(id[:name1], id[:mark1], id[:name2], id[:mark2])
  end

  def ask_ids
    chk = false

    print 'Player 1: Type your alias: '
    name1 = gets.chomp
    mark1 = choose_mark(name1, chk)

    print 'Player 2: Type your alias: '
    name2 = gets.chomp
    mark2 = mark1 == 'X' ? 'O' : 'X'
    print "#{name2} Your mark is: #{mark2}"
    puts ' '
    
    { name1: name1, mark1: mark1, name2: name2, mark2: mark2 }
  end

  def choose_mark(name, checker)
    until checker
      print "#{name} Choose your mark X or O: "
      mark = gets.chomp
      checker = check_mark(mark)
      puts 'Try again...' unless checker
    end
    mark
  end

  def check_mark(mark)

    out = case mark
          when 'X' then true
          when 'O' then true
          else false
          end
    puts 'Please type X or O' unless out
    out
  end
end

m = Main.new
