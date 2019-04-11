# Board Class
class Board
  EMPT = '       '.freeze
  EKS = ['Yb   dP', ' Yb.dP ', ' dP\'Yb ', 'dP   Yb'].freeze
  OHH = [' dP"Yb ', 'dP   Yb', 'Yb   dP', ' YbodP '].freeze
  def initialize
    @cells = {
      a1: '1      ', a2: EMPT, a3: EMPT, a4: EMPT,
      b1: '2      ', b2: EMPT, b3: EMPT, b4: EMPT,
      c1: '3      ', c2: EMPT, c3: EMPT, c4: EMPT,
      d1: '4      ', d2: EMPT, d3: EMPT, d4: EMPT,
      e1: '5      ', e2: EMPT, e3: EMPT, e4: EMPT,
      f1: '6      ', f2: EMPT, f3: EMPT, f4: EMPT,
      g1: '7      ', g2: EMPT, g3: EMPT, g4: EMPT,
      h1: '8      ', h2: EMPT, h3: EMPT, h4: EMPT,
      i1: '9      ', i2: EMPT, i3: EMPT, i4: EMPT
    }
  end

  def render_board(first_player, second_player, tie, fields = {})
    @cells.merge!(fields)
     
    return "\n\n
              TIC TAC TOE\n
    ┌─────────┬─────────┬─────────┐
    │ #{@cells[:a1]} │ #{@cells[:b1]} │ #{@cells[:c1]} │
    │ #{@cells[:a2]} │ #{@cells[:b2]} │ #{@cells[:c2]} │      #{first_player[:name]}: #{first_player[:score]}
    │ #{@cells[:a3]} │ #{@cells[:b3]} │ #{@cells[:c3]} │
    │ #{@cells[:a4]} │ #{@cells[:b4]} │ #{@cells[:c4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:d1]} │ #{@cells[:e1]} │ #{@cells[:f1]} │
    │ #{@cells[:d2]} │ #{@cells[:e2]} │ #{@cells[:f2]} │      #{second_player[:name]}: #{second_player[:score]}
    │ #{@cells[:d3]} │ #{@cells[:e3]} │ #{@cells[:f3]} │
    │ #{@cells[:d4]} │ #{@cells[:e4]} │ #{@cells[:f4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@cells[:g1]} │ #{@cells[:h1]} │ #{@cells[:i1]} │
    │ #{@cells[:g2]} │ #{@cells[:h2]} │ #{@cells[:i2]} │      TIE: #{tie}
    │ #{@cells[:g3]} │ #{@cells[:h3]} │ #{@cells[:i3]} │
    │ #{@cells[:g4]} │ #{@cells[:h4]} │ #{@cells[:i4]} │
    └─────────┴─────────┴─────────┘\n\n"
  end

  def update_board(index, mark)
    cells = {}
    graph = mark == 'X' ? EKS : OHH
    case index
    when 1
      cells[:a1] = graph[0]
      cells[:a2] = graph[1]
      cells[:a3] = graph[2]
      cells[:a4] = graph[3]
    when 2
      cells[:b1] = graph[0]
      cells[:b2] = graph[1]
      cells[:b3] = graph[2]
      cells[:b4] = graph[3]
    when 3
      cells[:c1] = graph[0]
      cells[:c2] = graph[1]
      cells[:c3] = graph[2]
      cells[:c4] = graph[3]
    when 4
      cells[:d1] = graph[0]
      cells[:d2] = graph[1]
      cells[:d3] = graph[2]
      cells[:d4] = graph[3]
    when 5
      cells[:e1] = graph[0]
      cells[:e2] = graph[1]
      cells[:e3] = graph[2]
      cells[:e4] = graph[3]
    when 6
      cells[:f1] = graph[0]
      cells[:f2] = graph[1]
      cells[:f3] = graph[2]
      cells[:f4] = graph[3]
    when 7
      cells[:g1] = graph[0]
      cells[:g2] = graph[1]
      cells[:g3] = graph[2]
      cells[:g4] = graph[3]
    when 8
      cells[:h1] = graph[0]
      cells[:h2] = graph[1]
      cells[:h3] = graph[2]
      cells[:h4] = graph[3]
    when 9
      cells[:i1] = graph[0]
      cells[:i2] = graph[1]
      cells[:i3] = graph[2]
      cells[:i4] = graph[3]
    end

    cells
  end

  def blank_board(first_player, second_player, tie)
    fells = {
      a1: '1      ', a2: EMPT, a3: EMPT, a4: EMPT,
      b1: '2      ', b2: EMPT, b3: EMPT, b4: EMPT,
      c1: '3      ', c2: EMPT, c3: EMPT, c4: EMPT,
      d1: '4      ', d2: EMPT, d3: EMPT, d4: EMPT,
      e1: '5      ', e2: EMPT, e3: EMPT, e4: EMPT,
      f1: '6      ', f2: EMPT, f3: EMPT, f4: EMPT,
      g1: '7      ', g2: EMPT, g3: EMPT, g4: EMPT,
      h1: '8      ', h2: EMPT, h3: EMPT, h4: EMPT,
      i1: '9      ', i2: EMPT, i3: EMPT, i4: EMPT
    }
      render_board(first_player, second_player, tie, fells)
  end
end
