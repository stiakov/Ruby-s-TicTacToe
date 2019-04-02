require 'rspec'
require_relative '../lib/req.rb'

RSpec.describe Player do
  let(:g) { Game.new('Eli', 'X', 'Satt', 'O') }
  let(:board) { Board.new('Eli', 'Satt') }
  let(:player1) { Player.new('Eli', 'X') }

  describe 'move' do
    it 'places a move in board game' do
      player1.stub(:gets).and_return("1\n")
      player1.move(player1, board)
      expect(player1.places.size).to eq(1)
    end
  end

  describe '.check_valid' do
    it 'when input is valid' do
      expect(player1.check_valid(2, board)).to eq(true)
    end
  end
end
