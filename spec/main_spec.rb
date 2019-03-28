
require_relative '../main.rb'
RSpec.describe Main do

  describe '.initialize' do
    it 'initializes game' do
      game = Game.new()
      expect {simulate_stdin("Eli") { Game.new }}.to output(" > end of games...").to_stdout
end
end