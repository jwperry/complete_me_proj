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
end