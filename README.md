## CompleteMe

This project is an update based on a project I did as a student at the Turing
School of Software & Design in late 2015. It simulates a simple text
autocorrect feature using an n-dimensional Trie data structure:
* [Tries Wikipedia Article](https://en.wikipedia.org/wiki/Trie)

### Input File

We will use our system dictionary located at `/usr/share/dict/words`
to populate the dictionary for our Trie. Also included at the root
level of the repo is an `addresses.csv` file containing address
data from the city of Denver to show a real world application.

### Features

This project includes the following basic functionality:

1. Insert a word into the dictionary.
2. Count the total number of words in the dictionary.
3. Insert a newline-separated list of words into the dictionary.
4. Insert data from a CSV file into the dictionary.
4. Suggest completions for a given substring.
5. Select a completion for a given substring.
6. Weight suggestions based on previous selections.

### Interacting With This Project

To see a simple demonstration of the project's features, navigate to the `/lib`
folder and run `ruby complete_me_main.rb`. This will print out some examples of
its usage.

We can directly interact with this project from a Ruby REPL (ex: irb, or Pry).
Note that you may need to `bundle install` first.

```ruby
# Open irb from project root directory:
irb

# Require complete_me.rb:
require "./lib/complete_me"

# Declare new CompleteMe class object:
completion = CompleteMe.new

# Insert a new word into the dictionary:
completion.insert("pizza")

# Count words in the dictionary:
completion.count

# See suggestions for a substring:
completion.suggest("piz")

# Populate CompleteMe dictionary using systme dictionary:
completion.populate("/usr/share/dict/words")

# Select a word to use to complete a substring:
completion.select("piz", "pizza")
```

### Running the Tests

You can run the basic test suite by running `rake test` from the
`complete_me_proj/complete_me/` directory.

The project root folder also includes a test harness provided by the Turing
School of Software & Design. Similarly, you can run the test harness by
running `rake test` from the `complete_me_proj/complete_me_spec_harness`
directory.

Please note that you may have to `bundle install` before either will work.