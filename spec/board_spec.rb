require 'rspec'
require_relative '../lib/req'

RSpec.describe Game do
  let(:g) { Game.new('Eli', 'X', 'Satt', 'O') }
  let(:player1) { Player.new('Eli', 'X') }
  let(:player2) { Player.new('Satt', 'O') }
  let(:board) { Board.new('Eli', 'Satt') }

  before :all do
    @board = Board.new('Eli', 'Satt')
  end

  describe 'mark placement' do
    context 'Before any player has started' do
      it 'should be empty at start' do
        expect(@board.used_cells).to eq []
      end
    end

    context 'Setting scores' do
      it 'should set score for players' do
        @board.set_scores('Eli', 1)
        expect(@board.score1).to eq(1)
      end
    end
  end
end
