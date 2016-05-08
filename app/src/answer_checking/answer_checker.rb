require_relative './string_comparer'
module AnswerChecker
  def check_answer
    @correct_options = Array(CzechTranslation.where(
                             english_sentence: @english_sentence_id))
    correct_options_strings = @correct_options.map(&:display)
    comparrison = StringComparer.new(@answer, correct_options_strings)
    @correct = comparrison.equal?
  end
end