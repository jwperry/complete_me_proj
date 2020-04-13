class Node
  attr_accessor :data, :is_word, :branches

  def initialize(data)
    @data = data
    @is_word = false
    @branches = {}
  end

  def mark_as_word
    @is_word = true
  end
end