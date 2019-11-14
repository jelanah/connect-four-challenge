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
    5.downto 0 do |row|
      if rows[row][column].empty?
        rows[row][column] = "O"
        return
      end
    end
    puts "You can't put a checker in a full column!" 
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
