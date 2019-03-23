# Main class
require_relative './lib/Game'
class Main
  def initialize
    puts "\nWelcome to Tic Tac Toe's Match\n\n"
    id = ask_ids
    new_game = Game.new(id[:name1], id[:mark1], id[:name2], id[:mark2])
    new_game.turns
  end

  def ask_ids
    chk = false

    print 'PLAYER 1: Type your alias: '
    name1 = gets.chomp.upcase
    name1 = 'PLAYER 1' if name1.empty?
    mark1 = choose_mark(name1, chk)
    puts "\n=== #{name1} Your mark is: [#{mark1}] ===\n\n"

    print 'PLAYER 2: Type your alias: '
    name2 = gets.chomp.upcase
    name2 = 'PLAYER 2' if name2.empty?
    mark2 = mark1 == 'X' ? 'O' : 'X'
    print "\n=== #{name2} Your mark is: [#{mark2}] ===\n\n"

    { name1: name1, name2: name2, mark1: mark1, mark2: mark2 }
  end

  def choose_mark(name, checker)
    counter = 0
    until checker
      print "#{name} Choose your mark [X] or [O]: "
      mark = gets.chomp.upcase
      checker = check_mark(mark)
      counter += 1
      if counter == 3
        mark = 'X'
        checker = true
      end
      puts "Try again...\n\n" unless checker
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
