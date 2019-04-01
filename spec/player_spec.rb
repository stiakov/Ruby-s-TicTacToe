require 'rspec'

RSpec.describe Player do
  describe '.move' do
    let(:surface) do
      surface.new("\n\n
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
     └─────────┴─────────┴─────────┘\n\n")
    end
    let(:player1) { Player.new('Eli', 'X') }
    let(:player2) { Player.new('Satt', 'O') }
    let(:board) { Board.new('Eli', 'Satt') }
    
    context '#initialize' do
      it 'when initialized with type and name' do
        expect(player1.mark).to eq('X')
        expect(player1.name).to eq('Eli')
        expect(player2.mark).to eq('O')
        expect(player2.name).to eq('Satt')
        expect(player1.places.size).to eq(0)
        expect(player2.places.size).to eq(0)
        player1.stub(:gets).and_return("2\n")
        player1.move(player1, board)
        expect(player1.places.size).to eq(1)
        player2.stub(:gets).and_return("3\n")
        player2.move(player2, board)
        expect(player2.places.size).to eq(1)
        player1.stub(:gets).and_return("4\n")
        player1.move(player1, board)
        expect(player1.places.size).to eq(2)
      end

      # it 'places an user input in board' do
      # end
    end
  end
end
