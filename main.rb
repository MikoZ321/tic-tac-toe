require_relative "lib/game"
require_relative "lib/board"

game = Game.new
game.play_round until game.finished?
