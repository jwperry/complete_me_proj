gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require_relative '../lib/complete_me'

class TrieTest < Minitest::Test

  def setup
    @trie = Trie.new
    @complete = CompleteMe.new
  end

  def test_that_a_new_trie_can_be_created
    assert Trie.new
  end

  def test_that_head_node_exists_when_trie_is_created
    assert @trie.head
    assert_equal @trie.head.data, ""
  end

  def test_that_insert_adds_branches_to_head
    @complete.insert("a")
    refute @complete.head.branches.empty?
  end

  def test_that_insert_marks_as_word
    @complete.insert("a")
    assert @complete.head.branches["a"].is_word
  end

  def test_that_insert_adds_entire_word
    @complete.insert("cab")
    assert @complete.head.branches["c"].branches["a"].branches["b"]
  end

  def test_that_insert_adds_entire_word_and_marks_as_word
    @complete.insert("cab")
    assert @complete.head.branches["c"].branches["a"].branches["b"].is_word
  end

  def test_that_inserted_data_is_correct
    @complete.insert("d")
    assert_equal "d", @complete.head.branches["d"].data
  end

  def test_that_inserted_data_is_correct_with_multiple_steps
    @complete.insert("de")
    assert_equal "d", @complete.head.branches["d"].data
    assert_equal "e", @complete.head.branches["d"].branches["e"].data
  end

  def test_that_inserted_data_is_correct_on_different_branches
    @complete.insert("d")
    @complete.insert("e")
    assert_equal "d", @complete.head.branches["d"].data
    assert_equal "e", @complete.head.branches["e"].data
  end

  def test_that_populate_inserts_entire_word
    @complete.populate("cab")
    assert @complete.head.branches["c"].branches["a"].branches["b"]
  end

  def test_that_populate_inserts_multiple_words
    @complete.populate("a\nb")
    assert_equal "a", @complete.head.branches["a"].data
    assert_equal "b", @complete.head.branches["b"].data
  end
end