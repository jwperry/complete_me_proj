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

  def count
    @trie.count
  end

  def suggest(input)
    suggestions = get_suggestions(input, @trie.head)
    format_suggestions(suggestions)
  end

  def get_suggestions(input, node)
    suggestions = []
    suggestions << "" if (node.is_word && input.empty?)
    first_char, input_remainder = slice_if_not_empty(input)

    if first_char.empty?
      node.branches.values.each { |branch| suggestions << get_suggestions("", branch) }
    else
      suggestions << get_suggestions(input_remainder, node.branches[first_char])
    end
    update_suggestions(suggestions, node)
  end

  def slice_if_not_empty(input)
    if input.empty?
      first_char, input_remainder = "", ""
    else
      first_char = input.slice!(0)
      input_remainder = input
    end
    return first_char, input_remainder
  end

  def update_suggestions(suggestions, node)
    suggestions.flatten.map { |suggestion| suggestion.prepend(node.data) }
  end
  
  def format_suggestions(suggestions)
    sorted_suggestions = suggestions.map do |suggestion|
      [get_rank(suggestion), suggestion]
    end.sort!.flatten!
    sorted_suggestions.select { |n| n.class == String }
  end

  def get_rank(word)
    find_word(word).rank
  end

  def find_word(word)
    location = head
    word.downcase.chomp.each_char do |c|
      if location.branches.has_key?(c)
        location = location.branches[c]
      else
        puts "Selected word is not in the dictionary!"
        return nil
      end
    end
    location
  end

  def select(input, word)
    # Lower rank = higher priority. This decrements instead of increments
    # because of how Turing spec_harness is written.
    find_word(word).rank -= 1
  end
end