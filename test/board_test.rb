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

end
