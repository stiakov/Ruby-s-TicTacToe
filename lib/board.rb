# Board class
class Board
  attr_accessor :box, :board

  def initialize
    empt = '       '
    @box = {
      a1: '1      ', a2: empt, a3: empt, a4: empt, box_id_1: 1,
      b1: '2      ', b2: empt, b3: empt, b4: empt, box_id_2: 2,
      c1: '3      ', c2: empt, c3: empt, c4: empt, box_id_3: 3,
      d1: '4      ', d2: empt, d3: empt, d4: empt, box_id_4: 4,
      e1: '5      ', e2: empt, e3: empt, e4: empt, box_id_5: 5,
      f1: '6      ', f2: empt, f3: empt, f4: empt, box_id_6: 6,
      g1: '7      ', g2: empt, g3: empt, g4: empt, box_id_7: 7,
      h1: '8      ', h2: empt, h3: empt, h4: empt, box_id_8: 8,
      i1: '9      ', i2: empt, i3: empt, i4: empt, box_id_9: 9
    }
    @eks = ['Yb   dP', ' Yb.dP ', ' dP\'Yb ', 'dP   Yb']
    @ohh = [' dP"Yb ', 'dP   Yb', 'Yb   dP', ' YbodP ']
    # ┌─┐└│┘┼┬┴├┤
    @board = "
                                                                                   
              TIC TAC TOE                                                          
                                                                                   
    ┌─────────┬─────────┬─────────┐
    │ #{@box[:a1]} │ #{@box[:b1]} │ #{@box[:c1]} │                                                
    │ #{@box[:a2]} │ #{@box[:b2]} │ #{@box[:c2]} │                                                
    │ #{@box[:a3]} │ #{@box[:b3]} │ #{@box[:c3]} │                                                
    │ #{@box[:a4]} │ #{@box[:b4]} │ #{@box[:c4]} │                                                
    ├─────────┼─────────┼─────────┤                                                
    │ #{@box[:d1]} │ #{@box[:e1]} │ #{@box[:f1]} │                                                
    │ #{@box[:d2]} │ #{@box[:e2]} │ #{@box[:f2]} │                                                
    │ #{@box[:d3]} │ #{@box[:e3]} │ #{@box[:f3]} │                                                
    │ #{@box[:d4]} │ #{@box[:e4]} │ #{@box[:f4]} │                                                
    ├─────────┼─────────┼─────────┤                                                
    │ #{@box[:g1]} │ #{@box[:h1]} │ #{@box[:i1]} │                                                
    │ #{@box[:g2]} │ #{@box[:h2]} │ #{@box[:i2]} │                                                
    │ #{@box[:g3]} │ #{@box[:h3]} │ #{@box[:i3]} │                                                
    │ #{@box[:g4]} │ #{@box[:h4]} │ #{@box[:i4]} │                                                
    └─────────┴─────────┴─────────┘                                                                                                               
                                                                                   
"
  end

  def load_board
    system 'clear'
    puts "#{@board}"
  end

  def update_board(index, mark)
    graph = mark == 'X' ? @eks : @ohh
    case index
    when '1'
      @box[:a1] = graph[0]
      @box[:a2] = graph[1]
      @box[:a3] = graph[2]
      @box[:a4] = graph[3]
    when '2'
      @box[:b1] = graph[0]
      @box[:b2] = graph[1]
      @box[:b3] = graph[2]
      @box[:b4] = graph[3]
    when '3'
      @box[:c1] = graph[0]
      @box[:c2] = graph[1]
      @box[:c3] = graph[2]
      @box[:c4] = graph[3]
    when '4'
      @box[:d1] = graph[0]
      @box[:d2] = graph[1]
      @box[:d3] = graph[2]
      @box[:d4] = graph[3]
    when '5'
      @box[:e1] = graph[0]
      @box[:e2] = graph[1]
      @box[:e3] = graph[2]
      @box[:e4] = graph[3]
    when '6'
      @box[:f1] = graph[0]
      @box[:f2] = graph[1]
      @box[:f3] = graph[2]
      @box[:f4] = graph[3]
    when '7'
      @box[:g1] = graph[0]
      @box[:g2] = graph[1]
      @box[:g3] = graph[2]
      @box[:g4] = graph[3]
    when '8'
      @box[:h1] = graph[0]
      @box[:h2] = graph[1]
      @box[:h3] = graph[2]
      @box[:h4] = graph[3]
    when '9'
      @box[:i1] = graph[0]
      @box[:i2] = graph[1]
      @box[:i3] = graph[2]
      @box[:i4] = graph[3]
    end

    @board = "\n\n
              TIC TAC TOE                         \n
    ┌─────────┬─────────┬─────────┐
    │ #{@box[:a1]} │ #{@box[:b1]} │ #{@box[:c1]} │
    │ #{@box[:a2]} │ #{@box[:b2]} │ #{@box[:c2]} │
    │ #{@box[:a3]} │ #{@box[:b3]} │ #{@box[:c3]} │
    │ #{@box[:a4]} │ #{@box[:b4]} │ #{@box[:c4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@box[:d1]} │ #{@box[:e1]} │ #{@box[:f1]} │
    │ #{@box[:d2]} │ #{@box[:e2]} │ #{@box[:f2]} │
    │ #{@box[:d3]} │ #{@box[:e3]} │ #{@box[:f3]} │
    │ #{@box[:d4]} │ #{@box[:e4]} │ #{@box[:f4]} │
    ├─────────┼─────────┼─────────┤
    │ #{@box[:g1]} │ #{@box[:h1]} │ #{@box[:i1]} │
    │ #{@box[:g2]} │ #{@box[:h2]} │ #{@box[:i2]} │
    │ #{@box[:g3]} │ #{@box[:h3]} │ #{@box[:i3]} │
    │ #{@box[:g4]} │ #{@box[:h4]} │ #{@box[:i4]} │
    └─────────┴─────────┴─────────┘               \n\n"
    
  end
end
