gem 'minitest', '~> 5.2'
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
end