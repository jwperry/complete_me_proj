gem 'minitest', '~> 5.14'
require 'minitest/autorun'
require_relative '../lib/complete_me'

class CompleteMeTest < Minitest::Test
  attr_reader :complete

  def setup
    @complete = CompleteMe.new
  end

  def test_that_declaring_creates_new_trie
    assert @complete.trie
  end

  def test_that_it_can_return_head_node
    assert @complete.head
    assert_equal "", @complete.head.data
  end

  def test_that_suggest_finds_all_suggestions_on_one_branch
    @complete.populate("an\nand\nandy")
    assert_equal ["an", "and", "andy"], @complete.suggest("a")
  end

  def test_that_suggest_finds_branched_suggestions
    @complete.populate("an\nand\nandy\nanon\nanonymous")
    assert_equal ["an", "and", "andy", "anon", "anonymous"], @complete.suggest("an")
  end

  def test_that_get_rank_returns_rank
    @complete.insert("a")
    assert_equal 0, @complete.head.branches["a"].rank
  end

  def test_that_slice_if_not_empty_separates_string_correctly
    assert_equal ["s", "tring"], @complete.slice_if_not_empty("string")
  end

  def test_that_slice_if_not_empty_returns_empty_strings_if_input_empty
    assert_equal ["", ""], @complete.slice_if_not_empty("")
  end

  def test_that_update_suggestions_correctly_flattens_and_maps
    suggestions = ["a", "b"], ["c", "d"]
    assert_equal ["za", "zb", "zc", "zd"], @complete.update_suggestions(suggestions, Node.new("z"))
  end

  def test_that_select_decrements_rank
    @complete.insert("a")
    @complete.select("", "a")
    assert_equal (-1), @complete.head.branches["a"].rank
  end

  def test_that_select_decrements_rank_multiple_times
    @complete.insert("a")
    @complete.select("", "a")
    @complete.select("", "a")
    @complete.select("", "a")
    assert_equal (-3), @complete.head.branches["a"].rank
  end

  def test_that_suggest_sorts_by_decremented_rank
    @complete.populate("an\nand\nandy")
    assert_equal ["an", "and", "andy"], @complete.suggest("a")
    @complete.select("", "and")
    @complete.select("", "and")
    @complete.select("", "andy")
    assert_equal ["and", "andy", "an"], @complete.suggest("a")
  end
end