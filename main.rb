require_relative './lib/req'

# Main Class
class Main
  include Messenger

  def initialize
    clean_sys # From Messenger module
    id = ask_data
    print_data id.values
    new_game = Game.new(id[:name1], id[:mark1], id[:name2], id[:mark2])
    new_game.turns
  end
end

m = Main.new
