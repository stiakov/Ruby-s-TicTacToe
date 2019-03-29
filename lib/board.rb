require_relative './req'

# Board Class
class Board
  attr_accessor :player1, :player2, :surface, :tie_score, :score1, :score2, :used_cells
  include Messenger

  $empt = '       '
  def initialize(player1, player2)
    @used_cells = []
    @player1 = player1
    @player2 = player2
    @score1 = 0
    @score2 = 0
    @tie_score = 0
    @eks = ['Yb   dP', ' Yb.dP ', ' dP\'Yb ', 'dP   Yb']
    @ohh = [' dP"Yb ', 'dP   Yb', 'Yb   dP', ' YbodP ']
    @cells = {
      a1: '1      ', a2: $empt, a3: $empt, a4: $empt,
      b1: '2      ', b2: $empt, b3: $empt, b4: $empt,
      c1: '3      ', c2: $empt, c3: $empt, c4: $empt,
      d1: '4      ', d2: $empt, d3: $empt, d4: $empt,
      e1: '5      ', e2: $empt, e3: $empt, e4: $empt,
      f1: '6      ', f2: $empt, f3: $empt, f4: $empt,
      g1: '7      ', g2: $empt, g3: $empt, g4: $empt,
      h1: '8      ', h2: $empt, h3: $empt, h4: $empt,
      i1: '9      ', i2: $empt, i3: $empt, i4: $empt
    }
    @surface = "\n\n
              TIC TAC TOE\n
    ┌─────────┬─────────┬─────────┐
    │ #{@cells[:a1]} │ #{@cells[:b1]} │ #{@cells[:c1]} │
    │ #{@cells[:a2]} │ #{@cells[:b2]} │ #{@cells[:c2]} │      #{@player1}: #{@score1}
    │ #{@cells[:a3]} │ #{@cells[:b3]} │ #{@cells[:c3]} │
    │ #{@cells[:a4]} │ #{@cells[:b4]} │ #{@cells[:c4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:d1]} │ #{@cells[:e1]} │ #{@cells[:f1]} │
    │ #{@cells[:d2]} │ #{@cells[:e2]} │ #{@cells[:f2]} │      #{@player2}: #{@score2}
    │ #{@cells[:d3]} │ #{@cells[:e3]} │ #{@cells[:f3]} │
    │ #{@cells[:d4]} │ #{@cells[:e4]} │ #{@cells[:f4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:g1]} │ #{@cells[:h1]} │ #{@cells[:i1]} │
    │ #{@cells[:g2]} │ #{@cells[:h2]} │ #{@cells[:i2]} │      TIE: #{@tie_score}
    │ #{@cells[:g3]} │ #{@cells[:h3]} │ #{@cells[:i3]} │
    │ #{@cells[:g4]} │ #{@cells[:h4]} │ #{@cells[:i4]} │
    └─────────┴─────────┴─────────┘\n\n"
  end

  def load_board
    clean_sys
    puts @surface
  end

  def update_board(index, mark)
    graph = mark == 'X' ? @eks : @ohh
    case index
    when '1'
      @cells[:a1] = graph[0]
      @cells[:a2] = graph[1]
      @cells[:a3] = graph[2]
      @cells[:a4] = graph[3]
    when '2'
      @cells[:b1] = graph[0]
      @cells[:b2] = graph[1]
      @cells[:b3] = graph[2]
      @cells[:b4] = graph[3]
    when '3'
      @cells[:c1] = graph[0]
      @cells[:c2] = graph[1]
      @cells[:c3] = graph[2]
      @cells[:c4] = graph[3]
    when '4'
      @cells[:d1] = graph[0]
      @cells[:d2] = graph[1]
      @cells[:d3] = graph[2]
      @cells[:d4] = graph[3]
    when '5'
      @cells[:e1] = graph[0]
      @cells[:e2] = graph[1]
      @cells[:e3] = graph[2]
      @cells[:e4] = graph[3]
    when '6'
      @cells[:f1] = graph[0]
      @cells[:f2] = graph[1]
      @cells[:f3] = graph[2]
      @cells[:f4] = graph[3]
    when '7'
      @cells[:g1] = graph[0]
      @cells[:g2] = graph[1]
      @cells[:g3] = graph[2]
      @cells[:g4] = graph[3]
    when '8'
      @cells[:h1] = graph[0]
      @cells[:h2] = graph[1]
      @cells[:h3] = graph[2]
      @cells[:h4] = graph[3]
    when '9'
      @cells[:i1] = graph[0]
      @cells[:i2] = graph[1]
      @cells[:i3] = graph[2]
      @cells[:i4] = graph[3]
    end

    @surface = "\n\n
              TIC TAC TOE\n
    ┌─────────┬─────────┬─────────┐
    │ #{@cells[:a1]} │ #{@cells[:b1]} │ #{@cells[:c1]} │
    │ #{@cells[:a2]} │ #{@cells[:b2]} │ #{@cells[:c2]} │      #{@player1}: #{@score1}
    │ #{@cells[:a3]} │ #{@cells[:b3]} │ #{@cells[:c3]} │
    │ #{@cells[:a4]} │ #{@cells[:b4]} │ #{@cells[:c4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:d1]} │ #{@cells[:e1]} │ #{@cells[:f1]} │
    │ #{@cells[:d2]} │ #{@cells[:e2]} │ #{@cells[:f2]} │      #{@player2}: #{@score2}
    │ #{@cells[:d3]} │ #{@cells[:e3]} │ #{@cells[:f3]} │
    │ #{@cells[:d4]} │ #{@cells[:e4]} │ #{@cells[:f4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:g1]} │ #{@cells[:h1]} │ #{@cells[:i1]} │
    │ #{@cells[:g2]} │ #{@cells[:h2]} │ #{@cells[:i2]} │      TIE: #{@tie_score}
    │ #{@cells[:g3]} │ #{@cells[:h3]} │ #{@cells[:i3]} │
    │ #{@cells[:g4]} │ #{@cells[:h4]} │ #{@cells[:i4]} │
    └─────────┴─────────┴─────────┘\n\n"
    load_board
  end

  def set_scores(player, score)
    @score1 = score if @player1 == player
    @score2 = score if @player2 == player
    @tie_score = score if player == 'tie'
    @surface = "\n\n
              TIC TAC TOE\n
    ┌─────────┬─────────┬─────────┐
    │ #{@cells[:a1]} │ #{@cells[:b1]} │ #{@cells[:c1]} │
    │ #{@cells[:a2]} │ #{@cells[:b2]} │ #{@cells[:c2]} │      #{@player1}: #{@score1}
    │ #{@cells[:a3]} │ #{@cells[:b3]} │ #{@cells[:c3]} │
    │ #{@cells[:a4]} │ #{@cells[:b4]} │ #{@cells[:c4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:d1]} │ #{@cells[:e1]} │ #{@cells[:f1]} │
    │ #{@cells[:d2]} │ #{@cells[:e2]} │ #{@cells[:f2]} │      #{@player2}: #{@score2}
    │ #{@cells[:d3]} │ #{@cells[:e3]} │ #{@cells[:f3]} │
    │ #{@cells[:d4]} │ #{@cells[:e4]} │ #{@cells[:f4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:g1]} │ #{@cells[:h1]} │ #{@cells[:i1]} │
    │ #{@cells[:g2]} │ #{@cells[:h2]} │ #{@cells[:i2]} │      TIE: #{@tie_score}
    │ #{@cells[:g3]} │ #{@cells[:h3]} │ #{@cells[:i3]} │
    │ #{@cells[:g4]} │ #{@cells[:h4]} │ #{@cells[:i4]} │
    └─────────┴─────────┴─────────┘\n\n"
  end

  def clean_board
    @cells = {
      a1: '1      ', a2: $empt, a3: $empt, a4: $empt,
      b1: '2      ', b2: $empt, b3: $empt, b4: $empt,
      c1: '3      ', c2: $empt, c3: $empt, c4: $empt,
      d1: '4      ', d2: $empt, d3: $empt, d4: $empt,
      e1: '5      ', e2: $empt, e3: $empt, e4: $empt,
      f1: '6      ', f2: $empt, f3: $empt, f4: $empt,
      g1: '7      ', g2: $empt, g3: $empt, g4: $empt,
      h1: '8      ', h2: $empt, h3: $empt, h4: $empt,
      i1: '9      ', i2: $empt, i3: $empt, i4: $empt
    }

    @surface = "\n\n
              TIC TAC TOE\n
    ┌─────────┬─────────┬─────────┐
    │ #{@cells[:a1]} │ #{@cells[:b1]} │ #{@cells[:c1]} │
    │ #{@cells[:a2]} │ #{@cells[:b2]} │ #{@cells[:c2]} │      #{@player1}: #{@score1}
    │ #{@cells[:a3]} │ #{@cells[:b3]} │ #{@cells[:c3]} │
    │ #{@cells[:a4]} │ #{@cells[:b4]} │ #{@cells[:c4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:d1]} │ #{@cells[:e1]} │ #{@cells[:f1]} │
    │ #{@cells[:d2]} │ #{@cells[:e2]} │ #{@cells[:f2]} │      #{@player2}: #{@score2}
    │ #{@cells[:d3]} │ #{@cells[:e3]} │ #{@cells[:f3]} │
    │ #{@cells[:d4]} │ #{@cells[:e4]} │ #{@cells[:f4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:g1]} │ #{@cells[:h1]} │ #{@cells[:i1]} │
    │ #{@cells[:g2]} │ #{@cells[:h2]} │ #{@cells[:i2]} │      TIE: #{@tie_score}
    │ #{@cells[:g3]} │ #{@cells[:h3]} │ #{@cells[:i3]} │
    │ #{@cells[:g4]} │ #{@cells[:h4]} │ #{@cells[:i4]} │
    └─────────┴─────────┴─────────┘\n\n"
    load_board
  end
end
