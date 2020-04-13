require_relative 'complete_me'

NEW_LINE = "\n"

complete_me = CompleteMe.new

# Usage Demo
puts "Read system dictionary into complete_me dictionary:"
puts "Dictionary word count: #{complete_me.count}"
complete_me.populate(File.read("/usr/share/dict/words"))
puts "New dictionary word count: #{complete_me.count}"
puts NEW_LINE

puts "Show suggestions for 'piz':"
puts complete_me.suggest("piz")
puts NEW_LINE

puts "Add new word 'pizzazz':"
complete_me.insert("pizzazz")
puts "New dictionary word count: #{complete_me.count}"
puts NEW_LINE

puts "Show updated suggestions for 'piz':"
puts complete_me.suggest("piz")
puts NEW_LINE

puts "Weight 'pizzeria' higher so that it shows as the first result:"
complete_me.select("piz", "pizzeria")
puts complete_me.suggest("piz")
puts NEW_LINE

puts "Search for a word that isn't in the dictionary:"
complete_me.find_word("shamwow")
puts NEW_LINE

# Address Demo
puts "Read Denver address data from addresses.csv into complete_me dictionary:"
address_data = complete_me.read_csv("../addresses.csv")
complete_me.populate(address_data)
puts "New dictionary word count: #{complete_me.count}"
puts NEW_LINE

puts "Show suggestions for 1956 lawrence st unit 5:"
puts complete_me.suggest("1956 lawrence st unit 5")