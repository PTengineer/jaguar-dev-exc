class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)

    # Splits lengthy string by whitespace to words then evaluates length,
    # if greater than 4 replaces word
    # then outputs reconnected string
    words_arr = str.scan(/\S+/)

    # Words with connected punctuation are treated as entire word, thusly replaced
    # Match to check for punctuation (non alpha) then preserve punctuation
    word_parsing_regex = /^([^A-Za-z]*)([A-Za-z]+)([^A-Za-z]*)$/

    replaced_words = words_arr.map do |token|

      match_data = token.match(word_parsing_regex)

      if match_data
        leading_punctuation  = match_data[1] # "!" in "!sample"
        word_part            = match_data[2] # "something" in "%something%"
        trailing_punctuation = match_data[3] # "?" in "question?"

        if word_part.length > 4
          if token[0] && token[0].match?(/[A-Z]/)
            transformed_word_part = "Marklar" # Replace if capitalized
          else
            transformed_word_part = "marklar"
          end
        else
          transformed_word_part = word_part
        end

        # Reassemble the word token with its original punctuation
        "#{leading_punctuation}#{transformed_word_part}#{trailing_punctuation}"
      else
        token
      end

    end

    return replaced_words.join(' ')

  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)

    # Calculates the Fib sequence up to "nth" term
    # selects even numbers then
    # sums the selected even numbers
    return 0 if nth <= 0  # base case 0, case 1 doesn't apply here

    fib = [1, 1]
    while fib.length < nth
      fib << fib[-1] + fib[-2]
    end

    fib.select { |num| num.even? }.sum
  end

end
