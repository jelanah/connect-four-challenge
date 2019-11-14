require 'test_helper'

class BoardTest < MiniTest::Test
  def setup
    @board = Board.new
  end

  def test_drop_checker_full_column
    assert_equal @board.drop_checker(:black,0), true
    assert_equal @board.drop_checker(:black,0), true
    assert_equal @board.drop_checker(:black,0), true
    assert_equal @board.drop_checker(:black,0), true
    assert_equal @board.drop_checker(:black,0), true
    assert_equal @board.drop_checker(:black,0), true
    assert_equal @board.drop_checker(:black,0), false
    
  end

  def test_drop_checker_invalid_column_number
    assert_equal @board.drop_checker(:black,7), false
    assert_equal @board.drop_checker(:black,-3), false
  end

  def test_drop_checker_invalid_color
    assert_equal @board.drop_checker(:blue,0), false
    assert_equal @board.drop_checker(:pink,5), false
  end

end
