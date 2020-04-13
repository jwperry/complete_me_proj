gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require_relative '../lib/complete_me'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("a")
  end

  def test_that_a_new_node_can_be_created_with_data
    new_node = Node.new("test")
    assert_equal new_node.data, "test"
  end
end