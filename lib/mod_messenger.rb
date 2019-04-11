# output messages
module Messenger
  RANDOM_NAMES = %w[dormouse jaguar dung beetle rooster colt
                    ram lynx anteater mare jerboa guanaco quagga
                    fish bighorn finch rabbit cow goat duckbill].freeze

  def clean_sys
    Gem.win_platform? ? (system 'cls') : (system 'clear')
  end

  def who_goes_first(player)
    puts "\n    #{player[:name]} [#{player[:mark]}] goes first, make your move\n"
  end

  def ask_data
    player1 = get_player_data 1

    mark2 = player1[:mark] == 'X' ? 'O' : 'X'
    player2 = get_player_data 2, mark2

    { name1: player1[:name], mark1: player1[:mark],
      name2: player2[:name], mark2: player2[:mark] }
  end

  def get_player_data(num, mark = '')
    puts "Welcome to Tic Tac Toe\n\n" if mark.empty?
    print "\nPlayer #{num}: Type your alias: "

    name = gets.chomp.upcase
    name = RANDOM_NAMES.sample.upcase if name.empty?

    mark = choose_mark(name) if mark.empty?

    { name: name, mark: mark }
  end

  def choose_mark(name)
    print "\n#{name} type your mark [X] or [O] \nor press [Enter] to do a random selection: "
    mark = gets.chomp.upcase
    check_mark(mark) unless mark.empty?

    if mark.empty?
      mark = %w[X O].sample
      puts "[#{mark}] assigned"
    end
    mark
  end

  def check_mark(mark)
    out = case mark
          when 'X' then true
          when 'O' then true
          else false
          end

    puts "\nPlease type X or O" unless out
    out
  end

  def print_data(args)
    clean_sys
    puts "#{args[0]} your mark is [#{args[1]}]"
    puts "#{args[2]} you will be playing with [#{args[3]}]"
    puts "\nPress [Enter] to continue"
    gets.chomp
  end

  def load_board(board)
    print board
  end

  def invalid
    print "\n        Invalid position, try again!\n\n    Select position [1] to [9] if available: "
  end

  def select_position
    print '    Select position [1] to [9] if available: '
    selection = gets.chomp.to_i
    selection
  end

  def draw
    puts "    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n
    TIE, TRY AGAIN!\n
|+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n\n\n"
  end

  def winner_message(player)
    winner = "#{player[:name]} [#{player[:mark]}]"
    center_size = (26 - winner.size) / 2
    spaces = center_size > 0 ? '' * center_size : ''
    puts "    |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n
  #{spaces + winner} WINS!\n
  |+|+|+|+|+|+|+|+|+|+|+|+|+|+|+|\n\n\n"
  end

  def its_us
    puts "\nDeveloped in Ruby by: @st_iakov & @miss_elliev - 2019\n\n"
  end

  def next_game
    print '    Press [Enter] to PLAY AGAIN or [Q] to Quit: '
  end

  def next_game_warning
    print '    Please only type [Q] to quit or press [Enter] for a new game: '
  end
end
