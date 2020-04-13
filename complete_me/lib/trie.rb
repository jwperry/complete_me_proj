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

  def populate(words)
    words.each_line { |line| insert(line) }
  end

  def count(node=@head)
    counter = 0
    node.branches.each do |k, v|
      counter = counter + count(v)
    end
    node.is_word ? counter +=1 : counter
  end
end