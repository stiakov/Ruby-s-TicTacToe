require 'rspec'
require_relative '../lib/req.rb'

RSpec.describe Game do
  let(:g) { Game.new }
  let(:tie_false) { [1, 'O', 'X', 'O', 'X', 'O', 7, 8, 9] }
  let(:tie_true) { %w[X O X O X O X O X] }
  let(:winner_false) { ['X', 'O', 'X', 'O', 'O', 'X', 7, 8, 9] }
  let(:winner_true) { ['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9] }
  let(:winner_false) { ['X', 'O', 'X', 'O', 'O', 'X', 7, 8, 9] }
  let(:winner_true) { ['X', 'X', 'X', 'O', 'O', 6, 7, 8, 9] }
  let(:choices) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
  let(:lim_choices) { [1, 'O', 'X', 4, 5, 6, 7, 8, 9] }

  describe '#tie' do
    it '#tie must be false if there is cells available' do
      expect(g.tie(tie_false)).to eq(false)
    end
    it '#tie must be true if there is no cells available' do
      expect(g.tie(tie_true)).to eq(true)
    end
  end

  describe '#winner' do
    it '#winner must be false if there is no a streak' do
      expect(g.winner(winner_false, 'X')).to eq(false)
    end
    it '#winner must be false if there is no a streak' do
      expect(g.winner(winner_true, 'X')).to eq(true)
    end
  end

  describe '#check_valid' do
    it '#check_valid must be false if the input is not from 1 to 9' do
      expect(g.check_valid(10, choices)).to eq(false)
    end
    it '#check_valid must be false if the input is not a number' do
      expect(g.check_valid('X', choices)).to eq(false)
    end
    it '#check_valid must be true if the input is between 1 and 9' do
      expect(g.check_valid(3, choices)).to eq(true)
    end
    it '#check_valid must be true if the input is between 1 and 9' do
      expect(g.check_valid(2, lim_choices)).to eq(false)
    end
  end
end
