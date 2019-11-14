require_relative 'board'

# This class is for initializing and running a game. It will
# need a new board and a way to keep track of who is the
# current player. The rest is up to you:
class Game
  def initialize
    @board = Board.new
    @current_player = :black
    @board.print_grid
    
  end

  # Runs the game until there is a winner.
  def start
    puts 'A new game has begun!'
    # puts "Whats your color? Red or black"
    # color = gets 
    # puts "Okay," + black + ". You're up first!"

  until @board.game_won?
    puts "Hey " + @current_player.to_s + ", it's your turn. Which column do you want to place the checker?"
    col = gets.chomp.to_i
    @board.drop_checker(@current_player,col)
    @board.print_grid
    
    if @current_player == :black
      @current_player = :red
      
    else
    @current_player = :black
    end


    
  end 

  end
end
