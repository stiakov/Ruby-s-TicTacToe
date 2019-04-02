require 'rspec'
require_relative '../lib/req.rb'

# player = object_double(:places => [1, 4, 7], :name => "Eli", :mark => "X")
RSpec.describe Game do
  let(:g) {Game.new('Eli', 'X', 'Satt', 'O')}
  let(:player) { { places: [1, 3, 7, 2, 4], name: 'Eli', mark: 'X' } }
  let(:board) { Board.new('Eli', 'Satt') }
  
  describe '#check_winner' do
    it 'checks winner' do
      :g.moves_counter = 5
      expect(g.winner_update(player, board)).to eq(true)
    end
  end
end
