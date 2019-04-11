require_relative './lib/req'

# Main Class
class Main
  include Messenger

  def initialize
    clean_sys # From Messenger module
    a = Game.new
    a.players
    a.turns
  end
end

m = Main.new
