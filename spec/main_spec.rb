require_relative '../main.rb'
require 'rspec'

RSpec.describe Player do
  describe '.initialize' do
    it 'initializes game' do
      game = Main.new
      game.stub(:gets).and_return("HOLALAL")
      # expect { game }.to eql(game.is_a?(Game))
    end
  end
end
