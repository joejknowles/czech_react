require_relative './string_comparer'
module AnswerChecker
  def check_answer
    @correct_options = Array(CzechTranslation.where(
                               english_sentence: @sentence))
    @correct_options.map!(&:get_as_string)
    comparrison = StringComparer.new(@answer, @correct_options)
    @correct = comparrison.equal?
  end
end