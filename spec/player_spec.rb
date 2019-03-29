require 'rspec'

RSpec.describe Player do
  describe '.move' do
    
    let(:surface) {surface.new("\n\n
              TIC TAC TOE\n
    ┌─────────┬─────────┬─────────┐
    │ #{@cells[:a1]} │ Yb   dP │ #{@cells[:c1]} │
    │ #{@cells[:a2]} │  Yb.dP  │ #{@cells[:c2]} │      #{@player1}: #{@score1}
    │ #{@cells[:a3]} │  dP'Yb  │ #{@cells[:c3]} │
    │ #{@cells[:a4]} │ dP   Yb │ #{@cells[:c4]} │
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
    └─────────┴─────────┴─────────┘\n\n")}
    it 'places an user input in board' do
      player = Player.new('E','X')
      board = Board.new('player1', 'player2')
      player.stub(:gets).and_return("2\n")
      expect(player.move(player, board)).to output(:surface).to_stdout
    end
  end
end
