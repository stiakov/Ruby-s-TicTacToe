require 'rspec'
require_relative '../lib/req.rb'

# player = object_double(:places => [1, 4, 7], :name => "Eli", :mark => "X")
RSpec.describe Game do
  let(:g) { Game.new('Eli', 'X', 'Satt', 'O') }
  let(:player1) { Player.new('Eli', 'X') }
  let(:player2) { Player.new('Satt', 'O') }
  # let(:player) { { places: [1, 3, 7, 2, 4], name: 'Eli', mark: 'X', score: 0 } }
  let(:board) { Board.new('Eli', 'Satt') }

  describe '#check_winner' do
    it 'winner_update must be false since the moves_counter is lesser than 5' do
      expect(g.winner_update(player1, board)).to eq(false)
    end
  end

  describe '#new_game?' do
    it 'new_game must return true if user press [Q]' do
      g.stub(:gets).and_return("q\n")
      expect(g.new_game?).to eq(true)
    end
  end
  
  describe '#make_your_move?' do
    it 'make_your_move must return value stored in @moves_counter' do
      player1.stub(:gets).and_return("1\n")
      expect(g.make_your_move(player1, board)).to eq(1)
      player2.stub(:gets).and_return("2\n")
      expect(g.make_your_move(player2, board)).to eq(2)
      player1.stub(:gets).and_return("3\n")
      expect(g.make_your_move(player1, board)).to eq(3)
      player2.stub(:gets).and_return("4\n")
      expect(g.make_your_move(player2, board)).to eq(4)
      player1.stub(:gets).and_return("5\n")
      expect(g.make_your_move(player1, board)).to eq(5)
    end
  end
  
  describe '#winner_update' do
    it '#winner_update must return false if there\'s no winner' do
      expect(g.winner_update(player1, board)).to eq(false)
    end
  end
  
  describe '#make_your_move?' do
    it 'make_your_move must return value stored in @moves_counter' do
      player1.stub(:gets).and_return("1\n")
      expect(g.make_your_move(player1, board)).to eq(1)
      player2.stub(:gets).and_return("2\n")
      expect(g.make_your_move(player2, board)).to eq(2)
      player1.stub(:gets).and_return("3\n")
      expect(g.make_your_move(player1, board)).to eq(3)
      player2.stub(:gets).and_return("4\n")
      expect(g.make_your_move(player2, board)).to eq(4)
      player1.stub(:gets).and_return("5\n")
      expect(g.make_your_move(player1, board)).to eq(5)
      player2.stub(:gets).and_return("6\n")
      expect(g.make_your_move(player2, board)).to eq(6)
      player1.stub(:gets).and_return("7\n")
      expect(g.make_your_move(player1, board)).to eq(7)
      expect(g.winner_update(player1, board)).to eq(true)
    end
  end
end
