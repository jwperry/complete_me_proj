require_relative "node"
require_relative "trie"

class CompleteMe

  def initialize
    @trie = Trie.new
  end

  def trie
    @trie
  end

  def head
    @trie.head
  end

  def insert(word)
    @trie.insert(word.downcase)
  end

  def populate(words)
    @trie.populate(words)
  end
end