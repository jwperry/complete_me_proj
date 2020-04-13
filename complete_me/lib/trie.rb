class Trie
  attr_accessor :head

  def initialize
    @head = Node.new("")
  end

  def insert(word)
    location = @head
    word.downcase.chomp.each_char do |c|
      unless location.branches.has_key?(c)
        location.branches[c] = Node.new(c)
      end
      location = location.branches[c]
    end
    location.mark_as_word
  end
end