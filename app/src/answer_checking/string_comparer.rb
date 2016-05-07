class StringComparer
  def initialize input_string, correct_strings
    @input_string, @correct_strings = input_string, correct_strings
  end

  def equal?
    @correct_strings.each do |correct_string|
      is_correct = equal(@input_string, correct_string)
      return true if is_correct
    end
    false
  end

  def equal string1, string2
    plain_chars(string1) == plain_chars(string2)
  end

  def plain_chars string
    string.unicode_normalize(:nfd).chars.select(&:ascii_only?).join.downcase.unicode_normalize(:nfc).gsub(/[^0-9a-z ]/i, '')
  end
end