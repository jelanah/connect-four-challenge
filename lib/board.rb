# Use this as a sketch of how your Board class could look, you can fill in these
# methods, or make a different class from scratch
require 'tty-table'

class Board
  attr_reader :table
  attr_accessor :rows

  def initialize
    generate_board
  end 

  # This method drops a checker down the column. 

  def drop_checker(color, column)

    if column < 0 || column > 5
      puts "Insert a column number 0-6!"
      return false
    end
    
    
    if color != :red && color != :black
      puts "Color must be red or black!"
      return false
    end
    
    5.downto 0 do |row| #Counts down to zero
      if rows[row][column].empty?
        if color == :black 
          rows[row][column] = "O"
        else
          rows[row][column] = "X"
        end
        return true
      end
    end
    puts "You can't put a checker in a full column!" 
    return false 
  end


  def generate_board
    rows = []
    6.times do
      rows << []
    end

    rows.each do |r|
      7.times do
        r << empty_string
      end
    end
    @rows = rows
  end

  def empty_string
    "".freeze
  end

  def headers
    [0, 1, 2, 3, 4, 5, 6]
  end

  def print_grid
    @table = TTY::Table.new headers, @rows
    puts @table.render(:ascii, padding: [1, 2, 1, 2])
  end

  def game_won?
    false
  end
end
