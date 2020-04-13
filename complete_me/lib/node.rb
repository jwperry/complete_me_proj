class Node
  attr_accessor :data, :is_word, :branches, :rank

  def initialize(data)
    @data = data
    @is_word = false
    @branches = {}
    @rank = 0
  end

  def mark_as_word
    @is_word = true
  end
end