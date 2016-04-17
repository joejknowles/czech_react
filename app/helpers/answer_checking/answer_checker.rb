module AnswerChecker
  def check_answer
    @correct_options = Array(CzechTranslation.where(
      english_sentence: @sentence))
    @correct_options.map!{ |czech| czech.get_as_string.downcase}
    @correct = @correct_options.include? @answer
  end
end